#!/bin/bash

ENV=python
RANDOM_SEED=0

TASK=causality


experiments=(

#original
#emb64
# "$TASK/ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --propensity=pred" 
# "$TASK/akb_ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5" 
# "$TASK/naive_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-5" 
# "$TASK/esmm_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=1." 
# "$TASK/multi_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --propensity=pred" 
# "$TASK/multi_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=1." 
# "$TASK/escm2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --lambda2=2. --propensity=pred" 
# "$TASK/escm2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=2." 
# "$TASK/v2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --lambda1=0.001 --lambda2=2. --lambda3=0.01 --propensity=pred" 
# "$TASK/v2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=2. --lambda3=1." 

#personalized
# "$TASK/ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --propensity=pred" 
# "$TASK/akb_ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5" 
# "$TASK/naive_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5" 
# "$TASK/esmm_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=2." 
# "$TASK/multi_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --propensity=pred" 
# "$TASK/multi_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-4 --lambda1=1." 
# "$TASK/escm2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --propensity=pred" 
# "$TASK/escm2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-4 --lambda1=1. --lambda2=2." 
# "$TASK/v2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --lambda3=1. --propensity=pred" 
# "$TASK/v2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=1. --lambda2=2. --lambda3=1." 

)

for index in ${!experiments[*]}; do
    echo ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED 
    $ENV ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED &
done
