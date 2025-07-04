#!/bin/bash

# Function to check the number of running processes
check_jobs() {
    jobs -r | wc -l
}

MAX_JOBS=4 # Maximum number of parallel jobs
COUNTER=0 # 전체 제출 카운터

# ENV=python
ENV=/home1/wonhyung64/anaconda3/envs/openmmlab/bin/python3

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

"$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
"$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
"$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
"$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
"$TASK/sensitivity.py --base-model=linearcf --dataset-name=original --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."
"$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0."

# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.0001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.001"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.01"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=0.1"
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=1."
# "$TASK/sensitivity.py --base-model=linearcf --dataset-name=personalized --loss-type=ips --weight-decay=1e-4 --lr=1e-4 --lambda1=10."

)

for index in ${!experiments[*]}; do
    # 최대 병렬 프로세스가 다 돌고 있으면 대기
    while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
        echo "Max jobs ($MAX_JOBS) running. Waiting..."
        sleep 1m
    done

    # GPU 할당 (round-robin)
    GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
    export CUDA_VISIBLE_DEVICES=$GPU_ID

    echo "Launching on GPU $GPU_ID: "
    echo ${experiments[$index]} --data-dir=$TASK/data 
    $ENV ${experiments[$index]} --data-dir=$TASK/data &

    (( COUNTER++ ))
    sleep 5
done