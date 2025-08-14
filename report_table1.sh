#!/bin/bash

ENV=python
RANDOM_SEED=0

TASK=interaction

experiments=(

#coat
# "$TASK/ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4" 
# "$TASK/akb_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." 
# "$TASK/naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4" 
# "$TASK/esmm.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.1" 
# "$TASK/multi_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=2." 
# "$TASK/multi_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2." 
# "$TASK/escm2_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2=1." 
# "$TASK/escm2_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2=1." 
# "$TASK/ips_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=1." 
# "$TASK/naive_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=1." 

#yahoo
# "$TASK/ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4"
# "$TASK/akb_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "$TASK/naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5"
# "$TASK/esmm.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=2."
# "$TASK/multi_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=1."
# "$TASK/multi_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=2."
# "$TASK/escm2_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=1."
# "$TASK/escm2_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=1."
# "$TASK/ips_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4"
# "$TASK/naive_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6"

#KuaiRec
# "$TASK/ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-4 --weight-decay=1e-4" 
# "$TASK/naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6" 
# "$TASK/multi_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=1." 
# "$TASK/esmm.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=1."  
# "$TASK/akb_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e- --weight-decay=1e- --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." 
# "$TASK/multi_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1=" 
# "$TASK/escm2_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1= --lambda2=" 
# "$TASK/escm2_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1= --lambda2=" 
# "$TASK/ips_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1= --lambda2= --lambda3=" 
# "$TASK/naive_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1= --lambda2= --lambda3=" 


)

for index in ${!experiments[*]}; do
    echo ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED 
    $ENV ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED &
done
