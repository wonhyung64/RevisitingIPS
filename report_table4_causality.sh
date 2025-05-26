#!/bin/bash

TASK=causality
ENV=python
RANDOM_SEED=0


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-6 --weight-decay=1e-2 --propensity=pred"
"--base-model=linearcf --dataset-name=personalized --lr=1e-6 --weight-decay=1e-2 --propensity=pred"
)
EXECUTION_FILE=$TASK/ips_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr1=1e-4 --lamb1=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5"
"--base-model=linearcf --dataset-name=personalized --lr1=1e-4 --lamb1=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5"
)
EXECUTION_FILE=$TASK/akb_ips_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-3 --weight-decay=1e-5"
"--base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5"
)
EXECUTION_FILE=$TASK/naive_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-3 --weight-decay=1e-5 --alpha=0.1"
"--base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5 --alpha=1."
)
EXECUTION_FILE=$TASK/esmm_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --alpha=0.001 --propensity=pred"
"--base-model=linearcf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-4 --alpha=0.001 --propensity=pred"
)
EXECUTION_FILE=$TASK/multi_plus_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-5 --alpha=2."
"--base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-6 --alpha=2."
)
EXECUTION_FILE=$TASK/multi_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --alpha=1. --beta=2. --propensity=pred"
"--base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5 --alpha=0.1 --beta=1. --propensity=pred"
)
EXECUTION_FILE=$TASK/escm2_plus_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-6 --alpha=2. --beta=1."
"--base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-5 --alpha=1. --beta=1."
)
EXECUTION_FILE=$TASK/escm2_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --alpha=0.001 --beta=1. --zeta=0.001 --propensity=pred"
"--base-model=linearcf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-4 --alpha=0.001 --beta=0.1 --zeta=2. --propensity=pred"
)
EXECUTION_FILE=$TASK/v2_plus_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=linearcf --dataset-name=original --lr=1e-4 --weight-decay=1e-5 --alpha=2. --beta=1. --zeta=0.01"
"--base-model=linearcf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-5 --alpha=2. --beta=2. --zeta=2."
)
EXECUTION_FILE=$TASK/v2_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done
