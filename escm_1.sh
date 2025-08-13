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
TASK=interaction


experiments=(

#coat
#emb64
# "$TASK/ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4" # fin
# "$TASK/akb_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." # fin
# "$TASK/naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4" # fin
# "$TASK/esmm.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.1" # fin
# "$TASK/multi_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-5 --lambda1=2." # fin
# "$TASK/multi_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2." # fin
# "$TASK/escm2_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2=1." # fin
# "$TASK/escm2_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2=1." # fin
# "$TASK/ips_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=1." # fin
# "$TASK/naive_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=1." # fin

#emb8
# "$TASK/ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4" # fin
# "$TASK/akb_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." # fin
# "$TASK/naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4" # fin
# "$TASK/esmm.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=2." # fin
# "$TASK/multi_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.01" # fin
# "$TASK/multi_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.1" # fin
# "$TASK/escm2_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001 --lambda2=2." # fin
# "$TASK/escm2_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.01 --lambda2=0.001" # fin
# "$TASK/ips_v2.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-4 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=0.001" # fin
# "$TASK/naive_v2.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=coat --batch-size=4096 --lr=1e-3 --weight-decay=1e-4 --lambda1=1. --lambda2=1. --lambda3=0.001" # fin


#yahoo
#emb64
# "$TASK/ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4" # fin
# "$TASK/akb_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." # fin
# "$TASK/naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5" # fin
# "$TASK/esmm.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=2." # fin
# "$TASK/multi_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=1." # fin
# "$TASK/multi_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --lambda1=2." # fin
# "$TASK/escm2_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=1." # fin
# "$TASK/escm2_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=1." # fin
# "$TASK/ips_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4" # fin
# "$TASK/naive_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6" # fin

#emb8
# "$TASK/ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4"
# "$TASK/akb_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." # fin
# "$TASK/naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-5"
# "$TASK/esmm.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-6 --lambda1=2." fin
# "$TASK/multi_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001" # fin
# "$TASK/multi_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=0.001" # fin
# "$TASK/escm2_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-2 --weight-decay=1e-4 --lambda1=0.001 --lambda2=2." # fin
# "$TASK/escm2_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=1. --lambda2=1." # fin
# "$TASK/ips_v2.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2=0.001 --lambda3=0.001" # fin

# re
# "$TASK/naive_v2.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-4 --weight-decay=1e-6 --lambda1=0.001 --lambda2= --lambda3="

#KuaiRec
#emb64
# "$TASK/ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-4 --weight-decay=1e-4" # fin
# "$TASK/naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6" # fin
# "$TASK/multi_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=1." # fin
# "$TASK/esmm.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=1."  # fin
# "$TASK/multi_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --lr=1e-3 --weight-decay=1e-5 --lambda1=0.001" # fin
# "$TASK/akb_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-4 --weight-decay=1e-5 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0." fin

# "$TASK/escm2_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001 --lambda2=0.1" 
"$TASK/escm2_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e-3 --weight-decay=1e-6 --lambda1=2. --lambda2=0.01" 

# cv2
# "$TASK/ips_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1= --lambda2= --lambda3=" 
# "$TASK/naive_v2.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --lr=1e- --weight-decay=1e- --lambda1= --lambda2= --lambda3=" 


)

for RANDOM_SEED in {0..3}; do
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
        echo ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED 
        $ENV ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED &

        (( COUNTER++ ))
        sleep 5
    done
done


TASK=causality


experiments=(

#original
#emb64
# "$TASK/ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --propensity=pred" #fin
# "$TASK/akb_ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5" #fin
# "$TASK/naive_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-5" #fin
# "$TASK/esmm_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=1." #fin
# "$TASK/multi_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --propensity=pred" #fin
# "$TASK/multi_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=1." #fin
# "$TASK/escm2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --lambda2=2. --propensity=pred" #fin
# "$TASK/escm2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=2." #fin
# "$TASK/v2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --lambda1=0.001 --lambda2=2. --lambda3=0.01 --propensity=pred" #fin
# "$TASK/v2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=2. --lambda2=2. --lambda3=1." #fin

#emb8
# "$TASK/ips_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-4 --propensity=pred"
# "$TASK/akb_ips_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5"
# "$TASK/naive_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-2 --weight-decay=1e-5"
# "$TASK/esmm_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=1."
# "$TASK/multi_plus_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --propensity=pred"
# "$TASK/multi_plus_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=1."

# cv2
# "$TASK/escm2_plus_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=0.001 --lambda2= --propensity=pred"
# "$TASK/escm2_plus_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=1. --lambda2="
# "$TASK/v2_plus_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-4 --weight-decay=1e-4 --lambda1=0.001 --lambda2= --lambda3= --propensity=pred"
# "$TASK/v2_plus_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=original --lr=1e-3 --weight-decay=1e-4 --lambda1=2. --lambda2= --lambda3="

#personalized
#emb64
# "$TASK/ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --propensity=pred" # fin
# "$TASK/akb_ips_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5" # fin
# "$TASK/naive_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5" # fin
# "$TASK/esmm_plus.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=2." # fin
# "$TASK/multi_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --propensity=pred" # fin
# "$TASK/multi_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-4 --lambda1=1." # fin
# "$TASK/escm2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --propensity=pred" # fin
# "$TASK/escm2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-3 --weight-decay=1e-4 --lambda1=1. --lambda2=2." # fin
# "$TASK/v2_plus_ips.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=1. --lambda2=2. --lambda3=1. --propensity=pred" # fin
# "$TASK/v2_plus_naive.py --depth=0 --embedding-k=64 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=1. --lambda2=2. --lambda3=1." # fin

#emb8
# "$TASK/ips_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --propensity=pred"
# "$TASK/akb_ips_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --G=1 --lr2=0.05 --lr3=0.05 --lamb2=0. --lamb3=0. --gamma=1. --J=3 --C=1e-5"
# "$TASK/naive_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5"
# "$TASK/esmm_plus.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=2."
# "$TASK/multi_plus_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --propensity=pred"
# "$TASK/multi_plus_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-4 --weight-decay=1e-4 --lambda1=1."

# cv2
# "$TASK/escm2_plus_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=2. --lambda2= --propensity=pred"
# "$TASK/escm2_plus_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=2. --lambda2="
# "$TASK/v2_plus_ips.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-4 --lambda1=0.01 --lambda2= --lambda3= --propensity=pred"
# "$TASK/v2_plus_naive.py --depth=0 --embedding-k=8 --base-model=ncf --dataset-name=personalized --lr=1e-2 --weight-decay=1e-5 --lambda1=2. --lambda2= --lambda3="

)

for RANDOM_SEED in {0..9}; do
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
        echo ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED 
        $ENV ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED &

        (( COUNTER++ ))
        sleep 5
    done
done