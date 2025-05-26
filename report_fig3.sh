#!/bin/bash

TASK=causality
ENV=python
RANDOM_SEED=0


experiments=(
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
"--base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
"--base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
"--base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
"--base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."
)

EXECUTION_FILE=$TASK/sensitivity.py
for index in ${!experiments[*]}; do
    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED
done

