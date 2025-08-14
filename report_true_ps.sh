#!/bin/bash

ENV=python
RANDOM_SEED=0

TASK=causality

experiments=(

# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=10."
 
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."
 
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=ncf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=naive --weight-decay=1e-4 --lr=1e-4 --lambda1=10."
 
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."
 
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

)

for index in ${!experiments[*]}; do
    echo ${experiments[$index]} --data-dir=$TASK/data 
    $ENV ${experiments[$index]} --data-dir=$TASK/data &
done