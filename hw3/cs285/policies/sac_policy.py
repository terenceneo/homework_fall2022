from cs285.policies.MLP_policy import MLPPolicy
import torch
import numpy as np
from cs285.infrastructure import sac_utils
from cs285.infrastructure import pytorch_util as ptu
from cs285.infrastructure.sac_utils import SquashedNormal
from torch import nn
from torch import optim
import itertools

class MLPPolicySAC(MLPPolicy):
    def __init__(self,
                 ac_dim,
                 ob_dim,
                 n_layers,
                 size,
                 discrete=False,
                 learning_rate=3e-4,
                 training=True,
                 log_std_bounds=[-20,2],
                 action_range=[-1,1],
                 init_temperature=1.0,
                 **kwargs
                 ):
        super(MLPPolicySAC, self).__init__(ac_dim, ob_dim, n_layers, size, discrete, learning_rate, training, **kwargs)
        self.log_std_bounds = log_std_bounds
        self.action_range = action_range
        self.init_temperature = init_temperature
        self.learning_rate = learning_rate

        self.log_alpha = torch.tensor(np.log(self.init_temperature)).to(ptu.device)
        self.log_alpha.requires_grad = True
        self.log_alpha_optimizer = torch.optim.Adam([self.log_alpha], lr=self.learning_rate)

        self.target_entropy = -ac_dim

    @property
    def alpha(self):
        # Done: Formulate entropy term
        entropy = torch.exp(self.log_alpha)
        return entropy

    def get_action(self, obs: np.ndarray, sample=True) -> np.ndarray:
        # Done: return sample from distribution if sampling
        # if not sampling return the mean of the distribution 
        if len(obs.shape) > 1:
            observation = ptu.from_numpy(obs)
        else:
            observation = ptu.from_numpy(obs[None])

        with torch.no_grad():
            action, action_logprob = self.forward(observation, sample)
            action = ptu.to_numpy(action)
        return action

    # This function defines the forward pass of the network.
    # You can return anything you want, but you should be able to differentiate
    # through it. For example, you can return a torch.FloatTensor. You can also
    # return more flexible objects, such as a
    # `torch.distributions.Distribution` object. It's up to you!
    def forward(self, observation: torch.FloatTensor, sample):
        # Done: Implement pass through network, computing logprobs and apply correction for Tanh squashing

        # HINT: 
        # You will need to clip log values
        # You will need SquashedNormal from sac_utils file
        mean = self.mean_net(observation)
        log_std_tanhed = self.logstd.tanh()
        log_std_clipped = self.log_std_bounds[0] + (self.log_std_bounds[1] - self.log_std_bounds[0]) * (log_std_tanhed + 1) / 2
        std = log_std_clipped.exp()

        action_distribution = SquashedNormal(mean, std)

        if sample:
            normalized_action = action_distribution.rsample()
        else:
            normalized_action = action_distribution.mean

        action = self.action_range[0] + (self.action_range[1] - self.action_range[0]) * (normalized_action + 1) / 2
        action_logprob = action_distribution.log_prob(normalized_action).sum(dim=-1, keepdim=True)

        return action, action_logprob

    def update(self, obs, critic):
        # Done Update actor network and entropy regularizer
        # return losses and alpha value

        obs = ptu.from_numpy(obs)
        act, log_prob_act = self.forward(obs, sample=True)

        # Update actor network
        q1, q2 = critic.forward(obs.detach(), act)
        min_q = torch.minimum(q1, q2)
        actor_loss = (self.alpha.detach() * log_prob_act - min_q).mean()

        self.optimizer.zero_grad()
        actor_loss.backward()
        self.optimizer.step()

        # Update entropy regularizer
        alpha_loss = (self.alpha * (-log_prob_act - self.target_entropy).detach())
        alpha_loss = alpha_loss.mean()

        self.log_alpha_optimizer.zero_grad()
        alpha_loss.backward()
        self.log_alpha_optimizer.step()

        return actor_loss.item(), alpha_loss.item(), ptu.to_numpy(self.alpha)