# # Experiment 1
# echo running experiment 1...

# echo running q1_sb_no_rtg_dsa...
# python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 \
# -dsa --exp_name q1_sb_no_rtg_dsa

# echo running q1_sb_rtg_dsa... 
# python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 \
# -rtg -dsa --exp_name q1_sb_rtg_dsa

# echo running q1_sb_rtg_na... 
# python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 \
# -rtg --exp_name q1_sb_rtg_na

# echo running q1_lb_no_rtg_dsa... 
# python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 \
# -dsa --exp_name q1_lb_no_rtg_dsa

# echo running q1_lb_rtg_dsa... 
# python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 \
# -rtg -dsa --exp_name q1_lb_rtg_dsa

# echo running q1_lb_rtg_na... 
# python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 \
# -rtg --exp_name q1_lb_rtg_na


# # Experiment 2
# echo running experiment 2...

# python cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 \
# --ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 149 -lr 0.05 -rtg \
# --exp_name q2_b149_r0.05

# python cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 \
# --ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 200 -lr 0.05 -rtg \
# --exp_name q2_b200_r0.05

# # Template
# # python cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 \
# # --ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 149 -lr 0.05 -rtg \
# # --exp_name q2_b<b*>_r<r*>

# Experiment 4
echo running experiment 4...

python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.02 -rtg --nn_baseline \
--exp_name q4_search_b50000_lr0.02_rtg_nnbaseline

# Experiment 5
echo running experiment 5...

python cs285/scripts/run_hw2.py \
--env_name Hopper-v2 --ep_len 1000 \
--discount 0.99 -n 300 -l 2 -s 32 -b 2000 -lr 0.001 \
--reward_to_go --nn_baseline --action_noise_std 0.5 --gae_lambda 0 \
--exp_name q5_b2000_r0.001_lambda0

python cs285/scripts/run_hw2.py \
--env_name Hopper-v2 --ep_len 1000 \
--discount 0.99 -n 300 -l 2 -s 32 -b 2000 -lr 0.001 \
--reward_to_go --nn_baseline --action_noise_std 0.5 --gae_lambda 0.95 \
--exp_name q5_b2000_r0.001_lambda0.95

python cs285/scripts/run_hw2.py \
--env_name Hopper-v2 --ep_len 1000 \
--discount 0.99 -n 300 -l 2 -s 32 -b 2000 -lr 0.001 \
--reward_to_go --nn_baseline --action_noise_std 0.5 --gae_lambda 0.99 \
--exp_name q5_b2000_r0.001_lambda0.99

python cs285/scripts/run_hw2.py \
--env_name Hopper-v2 --ep_len 1000 \
--discount 0.99 -n 300 -l 2 -s 32 -b 2000 -lr 0.001 \
--reward_to_go --nn_baseline --action_noise_std 0.5 --gae_lambda 1 \
--exp_name q5_b2000_r0.001_lambda1

# # Experiment 3
echo running experiment 3...

python cs285/scripts/run_hw2.py \
--env_name LunarLanderContinuous-v2 --ep_len 1000 \
--discount 0.99 -n 100 -l 2 -s 64 -b 40000 -lr 0.005 \
--reward_to_go --nn_baseline --exp_name q3_b40000_r0.005

# Experiment 4 continue
echo running experiment 4 continue...

echo experiment 4, batch = 10000
python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 10000 -lr 0.005 -rtg --nn_baseline \
--exp_name q4_search_b10000_lr0.005_rtg_nnbaseline

python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 10000 -lr 0.01 -rtg --nn_baseline \
--exp_name q4_search_b10000_lr0.01_rtg_nnbaseline

python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 10000 -lr 0.02 -rtg --nn_baseline \
--exp_name q4_search_b10000_lr0.02_rtg_nnbaseline

echo experiment 4, batch = 30000
python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 30000 -lr 0.005 -rtg --nn_baseline \
--exp_name q4_search_b30000_lr0.005_rtg_nnbaseline

python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 30000 -lr 0.01 -rtg --nn_baseline \
--exp_name q4_search_b30000_lr0.01_rtg_nnbaseline

python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 30000 -lr 0.02 -rtg --nn_baseline \
--exp_name q4_search_b30000_lr0.02_rtg_nnbaseline

echo experiment 4, batch = 50000
python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.005 -rtg --nn_baseline \
--exp_name q4_search_b50000_lr0.005_rtg_nnbaseline

python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
--discount 0.95 -n 100 -l 2 -s 32 -b 50000 -lr 0.01 -rtg --nn_baseline \
--exp_name q4_search_b50000_lr0.01_rtg_nnbaseline

# # HalfCheetah with optimal values
# echo HalfCheetah with optimal values
# python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
# --discount 0.95 -n 100 -l 2 -s 32 -b <b*> -lr <r*> \
# --exp_name q4_b<b*>_r<r*>

# python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
# --discount 0.95 -n 100 -l 2 -s 32 -b <b*> -lr <r*> -rtg \
# --exp_name q4_b<b*>_r<r*>_rtg

# python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
# --discount 0.95 -n 100 -l 2 -s 32 -b <b*> -lr <r*> --nn_baseline \
# --exp_name q4_b<b*>_r<r*>_nnbaseline

# python cs285/scripts/run_hw2.py --env_name HalfCheetah-v4 --ep_len 150 \
# --discount 0.95 -n 100 -l 2 -s 32 -b <b*> -lr <r*> -rtg --nn_baseline \
# --exp_name q4_b<b*>_r<r*>_rtg_nnbaseline