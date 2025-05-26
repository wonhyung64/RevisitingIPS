#!/bin/bash

TASK=interaction
ENV=python
RANDOM_SEED=0


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5"
)
EXECUTION_FILE=$TASK/ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr1=1e-2 --lamb1=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr1=1e-2 --lamb1=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
)
EXECUTION_FILE=$TASK/akb_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6"
)
EXECUTION_FILE=$TASK/naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --alpha=0.001"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --alpha=1."
)
EXECUTION_FILE=$TASK/esmm.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --alpha=0.1"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --alpha=0.01"
)
EXECUTION_FILE=$TASK/multi_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --alpha=0.01"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --alpha=1."
)
EXECUTION_FILE=$TASK/multi_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --alpha=0.001 --beta=0.1"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --alpha=0.01 --beta=0.01"
)
EXECUTION_FILE=$TASK/escm2_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --alpha=0.001 --beta=0.1"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --alpha=0.1 --beta=1."
)
EXECUTION_FILE=$TASK/escm2_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6"
)
EXECUTION_FILE=$TASK/ips_v2.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=mf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4"
"--base-model=mf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6"
)
EXECUTION_FILE=$TASK/naive_v2.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done
