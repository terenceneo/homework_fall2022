# Run the code

Method 1: Run the notebook found in `cs285/scripts/run_hw1.ipynb`
Method2: Run the commands below for each of the parts.

## Section 1 (Behavior Cloning)

### Q1.2

Ant-v4

```shell
python cs285/scripts/run_hw1.py \
    --expert_policy_file cs285/policies/experts/Ant.pkl \
    --expert_data cs285/expert_data/expert_data_Ant-v4.pkl \
    --env_name Ant-v4 \
    --exp_name bc_ant \
    --ep_len 1000 \ 
    --eval_batch_size 5000 \
    --video_log_freq -1 \
    --eval_batch_size 5000
```

Walker2d-v4

```shell
python cs285/scripts/run_hw1.py \
    --expert_policy_file cs285/policies/experts/Walker2d.pkl \
    --expert_data cs285/expert_data/expert_data_Walker2d-v4.pkl \
    --env_name Walker2d-v4 \
    --exp_name bc_walker \
    --ep_len 1000 \ 
    --eval_batch_size 5000 \
    --video_log_freq -1 \
    --eval_batch_size 5000
```

To generate videos of the policy, remove the `--video_log_freq -1` flag.

### Q1.3

Vary num_agent_train_steps_per_iter from 1 to 2000. For example, for num_agent_train_steps_per_iter = 1000, run the following.

```shell
python cs285/scripts/run_hw1.py \
    --expert_policy_file cs285/policies/experts/Ant.pkl \
    --expert_data cs285/expert_data/expert_data_Ant-v4.pkl \
    --env_name Ant-v4 \
    --exp_name bc_ant \
    --ep_len 1000 \ 
    --eval_batch_size 5000 \
    --video_log_freq -1 \
    --eval_batch_size 5000 \
    --num_agent_train_steps_per_iter 1000
```

### Section 2 (DAgger)

Ant-v4

```shell
python cs285/scripts/run_hw1.py \
    --expert_policy_file cs285/policies/experts/Ant.pkl \
    --expert_data cs285/expert_data/expert_data_Ant-v4.pkl \
    --env_name Ant-v4 \
    --exp_name dagger_ant \
    --ep_len 1000 \ 
    --eval_batch_size 5000 \
    --n_iter 10 \
    --do_dagger \
    --video_log_freq -1
```

Walker2d-v4

```shell
python cs285/scripts/run_hw1.py \
    --expert_policy_file cs285/policies/experts/Walker2d.pkl \
    --expert_data cs285/expert_data/expert_data_Walker2d-v4.pkl \
    --env_name Walker2d-v4 \
    --exp_name bc_walker \
    --ep_len 1000 \ 
    --eval_batch_size 5000 \
    --n_iter 10 \
    --do_dagger \
    --video_log_freq -1
```

To generate videos of the policy, remove the `--video_log_freq -1` flag.
