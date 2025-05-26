#!/bin/bash

TASK=causality
ENV=python
RANDOM_SEED=0


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --propensity=pred"
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --propensity=pred"
)
EXECUTION_FILE=$TASK/ips_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5"
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5"
)
EXECUTION_FILE=$TASK/akb_ips_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-5"
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5"
)
EXECUTION_FILE=$TASK/naive_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=1."
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=2."
)
EXECUTION_FILE=$TASK/esmm_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --propensity=pred"
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --propensity=pred"
)
EXECUTION_FILE=$TASK/multi_plus_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=1."
"--base-model=ncf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-4 --lambda1=1."
)
EXECUTION_FILE=$TASK/multi_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --lambda2=2. --propensity=pred"
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --propensity=pred"
)
EXECUTION_FILE=$TASK/escm2_plus_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=2."
"--base-model=ncf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-4 --lambda1=1. --lambda2=2."
)
EXECUTION_FILE=$TASK/escm2_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --lambda1=0.001 --lambda2=2. --lambda3=0.01 --propensity=pred"
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --lambda3=1. --propensity=pred"
)
EXECUTION_FILE=$TASK/v2_plus_ips.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done


experiments=(
"--base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=2. --lambda3=1."
"--base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=1. --lambda2=2. --lambda3=1."
)
EXECUTION_FILE=$TASK/v2_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done
