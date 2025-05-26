#!/bin/bash

TASK=causality
ENV=python
RANDOM_SEED=0

experiments=(
"--dataset-name=original --lr=1e-3 --weight-decay=1e-4 --alpha=1. --omega=0.25"
)
EXECUTION_FILE=$TASK/multi_plus_naive.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done

experiments=(
"--dataset-name=original --lr=1e-4 --weight-decay=1e-4 --alpha=1. --omega=0.25"
)
EXECUTION_FILE=$TASK/esmm_plus.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done
