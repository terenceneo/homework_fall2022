# Experiment 1
echo running experiment 1...

echo running q1_sb_no_rtg_dsa...
python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 \
-dsa --exp_name q1_sb_no_rtg_dsa

echo running q1_sb_rtg_dsa... 
python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 \
-rtg -dsa --exp_name q1_sb_rtg_dsa

echo running q1_sb_rtg_na... 
python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 1000 \
-rtg --exp_name q1_sb_rtg_na

echo running q1_lb_no_rtg_dsa... 
python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 \
-dsa --exp_name q1_lb_no_rtg_dsa

echo running q1_lb_rtg_dsa... 
python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 \
-rtg -dsa --exp_name q1_lb_rtg_dsa

echo running q1_lb_rtg_na... 
python cs285/scripts/run_hw2.py --env_name CartPole-v0 -n 100 -b 5000 \
-rtg --exp_name q1_lb_rtg_na


# Experiment 2
echo running experiment 2...

python cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 \
--ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 149 -lr 0.05 -rtg \
--exp_name q2_b149_r0.05

python cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 \
--ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 200 -lr 0.05 -rtg \
--exp_name q2_b200_r0.05

# Template
# python cs285/scripts/run_hw2.py --env_name InvertedPendulum-v2 \
# --ep_len 1000 --discount 0.9 -n 100 -l 2 -s 64 -b 149 -lr 0.05 -rtg \
# --exp_name q2_b<b*>_r<r*>