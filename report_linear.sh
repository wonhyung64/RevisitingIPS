#!/bin/bash

ENV=python
RANDOM_SEED=0

TASK=interaction

experiments=(

#coat
# "$TASK/ips.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5" 
# "$TASK/akb_ips.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." 
# "$TASK/naive.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5" 
# "$TASK/esmm.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.001" 
# "$TASK/multi_ips.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.1" 
# "$TASK/multi_naive.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.01" 
# "$TASK/escm2_ips.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.001 --lambda2=0.1" 
# "$TASK/escm2_naive.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.001 --lambda2=0.1" 
# "$TASK/ips_v2.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=1." 
# "$TASK/naive_v2.py --embedding-k=64 --base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=1." 

#yahoo
# "$TASK/ips.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5" 
# "$TASK/akb_ips.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." 
# "$TASK/naive.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6" 
# "$TASK/esmm.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=1." 
# "$TASK/multi_ips.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.01" 
# "$TASK/multi_naive.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=1." 
# "$TASK/escm2_ips.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.01 --lambda2=0.01" 
# "$TASK/escm2_naive.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.1 --lambda2=1." 
# "$TASK/ips_v2.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=1. --lambda2=1. --lambda3=1." 
# "$TASK/naive_v2.py --embedding-k=64 --base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=1. --lambda2=1. --lambda3=1." 

)

for RANDOM_SEED in {0..9}; do
    for index in ${!experiments[*]}; do
        echo ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED 
        $ENV ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED &
    done
done


TASK=causality


experiments=(

#original
# "$TASK/ips_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-6 --weight-decay=1e-2 --propensity=pred" 
# "$TASK/akb_ips_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5" 
# "$TASK/naive_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-3 --weight-decay=1e-5" 
# "$TASK/esmm_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-3 --weight-decay=1e-5 --lambda1=0.1" 
# "$TASK/multi_plus_ips.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001 --propensity=pred" 
# "$TASK/multi_plus_naive.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-5 --lambda1=2." 
# "$TASK/escm2_plus_ips.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --propensity=pred" 
# "$TASK/escm2_plus_naive.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-6 --lambda1=2. --lambda2=1." 
# "$TASK/v2_plus_ips.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --lambda2=1. --lambda3=0.001 --propensity=pred" 
# "$TASK/v2_plus_naive.py --embedding-k=64 --base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-5 --lambda1=2. --lambda2=1. --lambda3=0.01" 

#personalized
# "$TASK/ips_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-6 --weight-decay=1e-2 --propensity=pred" 
# "$TASK/akb_ips_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5" 
# "$TASK/naive_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5" 
# "$TASK/esmm_plus.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5 --lambda1=1." 
# "$TASK/multi_plus_ips.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001 --propensity=pred" 
# "$TASK/multi_plus_naive.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-6 --lambda1=2." 
# "$TASK/escm2_plus_naive.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5 --lambda1=1. --lambda2=1." 
# "$TASK/escm2_plus_ips.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5 --lambda1=0.1 --lambda2=1. --propensity=pred" 
# "$TASK/v2_plus_ips.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --lambda2=0.1 --lambda3=2. --propensity=pred" 
# "$TASK/v2_plus_naive.py --embedding-k=64 --base-model=linearcf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-5 --lambda1=2. --lambda2=2. --lambda3=2." 

)

for RANDOM_SEED in {0..9}; do
    for index in ${!experiments[*]}; do
        echo ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED 
        $ENV ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED &
    done
done
