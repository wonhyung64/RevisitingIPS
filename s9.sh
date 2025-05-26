#!/bin/bash

TASK=interaction
# ENV=python
ENV=/home1/wonhyung64/anaconda3/envs/openmmlab/bin/python3
RANDOM_SEED=0


experiments=(
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6"

)
EXECUTION_FILE=$TASK/k_fold_cv/ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."

)
EXECUTION_FILE=$TASK/k_fold_cv/akb_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6"

)
EXECUTION_FILE=$TASK/k_fold_cv/naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=2."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5 --lambda1=2."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6 --lambda1=2."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=1."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5 --lambda1=1."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6 --lambda1=1."

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.1"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5 --lambda1=0.1"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.1"
    
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.01"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5 --lambda1=0.01"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.01"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.001"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-5 --lambda1=0.001"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.001"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-5 --lambda1=0.001"

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.001"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.001"
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.001"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=2."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=2."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=2."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=2."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=1."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=1."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=1."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=1."

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.1"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=0.1"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.1"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.1"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.01"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=0.01"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.01"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.01"

# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.001"
"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001"
"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001"

"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-5 --lambda1=0.001"
"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.001"
"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=0.001"

"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=0.001"
"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.001"
"--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.001"

)
EXECUTION_FILE=$TASK/k_fold_cv/esmm.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=2."
# "--base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=1."
)
EXECUTION_FILE=$TASK/k_fold_cv/multi_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2."
# "--base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=2."
)
EXECUTION_FILE=$TASK/k_fold_cv/multi.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2=1."
# "--base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=1."
)
EXECUTION_FILE=$TASK/k_fold_cv/escm2.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4"
# "--base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4"
)
EXECUTION_FILE=$TASK/k_fold_cv/ips_v2.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
# "--base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4"
# "--base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6"
)
EXECUTION_FILE=$TASK/k_fold_cv/naive_v2.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done
