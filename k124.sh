#!/bin/bash
#srun --cpus-per-task=48 -p gpu6,gpu2 --gres=gpu:a10:4 --pty bash


# Function to check the number of running processes
check_jobs() {
    jobs -r | wc -l
}

MAX_JOBS=4 # Maximum number of parallel jobs
COUNTER=0 # 전체 제출 카운터

TASK=interaction
# ENV=python
ENV=/home1/wonhyung64/anaconda3/envs/openmmlab/bin/python3
# ENV=/home2/wotjd1410/anaconda3/envs/synthetic/bin/python3
RANDOM_SEED=0
CV_RESTRICT=1


lr_options=(
    "--lr=1e-2"
    "--lr=1e-3"
    "--lr=1e-4"
)

wd_options=(
    "--weight-decay=1e-4"
    "--weight-decay=1e-5"
    "--weight-decay=1e-6"
)


experiments=(

# "--embedding-k=64 --depth=0 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
)
EXECUTION_FILE=$TASK/k_fold_cv/ips.py
for index in ${!experiments[*]}; do
    for index_wd in ${!wd_options[*]}; do
        for index_lr in ${!lr_options[*]}; do

            # 최대 병렬 프로세스가 다 돌고 있으면 대기
            while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                echo "Max jobs ($MAX_JOBS) running. Waiting..."
                sleep 1m
            done

            # GPU 할당 (round-robin)
            GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
            export CUDA_VISIBLE_DEVICES=$GPU_ID

            echo "Launching on GPU $GPU_ID: "
            echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
            $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

            (( COUNTER++ ))
            sleep 5

        done
    done
done


experiments=(

#kuairec
# "--embedding-k=64 --depth=0 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0. --num-epochs=500"
# "--embedding-k=64 --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0. --num-epochs=500"

)
EXECUTION_FILE=$TASK/k_fold_cv/akb_ips.py
for index in ${!experiments[*]}; do
    for index_wd in ${!wd_options[*]}; do
        for index_lr in ${!lr_options[*]}; do

            # 최대 병렬 프로세스가 다 돌고 있으면 대기
            while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                echo "Max jobs ($MAX_JOBS) running. Waiting..."
                sleep 1m
            done

            # GPU 할당 (round-robin)
            GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
            export CUDA_VISIBLE_DEVICES=$GPU_ID

            echo "Launching on GPU $GPU_ID: "
            echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
            $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

            (( COUNTER++ ))
            sleep 5

        done
    done
done



experiments=(

# "--embedding-k=64 --depth=0 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"

)
EXECUTION_FILE=$TASK/k_fold_cv/naive.py
for index in ${!experiments[*]}; do
    for index_wd in ${!wd_options[*]}; do
        for index_lr in ${!lr_options[*]}; do

            # 최대 병렬 프로세스가 다 돌고 있으면 대기
            while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                echo "Max jobs ($MAX_JOBS) running. Waiting..."
                sleep 1m
            done

            # GPU 할당 (round-robin)
            GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
            export CUDA_VISIBLE_DEVICES=$GPU_ID

            echo "Launching on GPU $GPU_ID: "
            echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
            $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

            (( COUNTER++ ))
            sleep 5

        done
    done
done


experiments=(

# "--embedding-k=64 --depth=0 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"

)

lambda1_options=(
    # "--lambda1=2."
    # "--lambda1=1."
    # "--lambda1=0.1"
    # "--lambda1=0.01"
    # "--lambda1=0.001"
)

EXECUTION_FILE=$TASK/k_fold_cv/esmm.py
for index in ${!experiments[*]}; do
    for index_l1 in ${!lambda1_options[*]}; do
        for index_wd in ${!wd_options[*]}; do
            for index_lr in ${!lr_options[*]}; do

                # 최대 병렬 프로세스가 다 돌고 있으면 대기
                while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                    echo "Max jobs ($MAX_JOBS) running. Waiting..."
                    sleep 1m
                done

                wandb login a1f59c7a0e53eed9b11d25edae53fdbe676fb53a

                # GPU 할당 (round-robin)
                GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
                export CUDA_VISIBLE_DEVICES=$GPU_ID

                echo "Launching on GPU $GPU_ID: "
                echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
                $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

                (( COUNTER++ ))
                sleep 5

            done
        done
    done
done


experiments=(

# "--embedding-k=64 --depth=0 --loss-type=naive --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --loss-type=naive --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"

"--embedding-k=64 --depth=0 --loss-type=ips --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --loss-type=ips --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"

)

lambda1_options=(
    # "--lambda1=2."
    # "--lambda1=1."
    # "--lambda1=0.1"
    "--lambda1=0.01"
    # "--lambda1=0.001"
)

EXECUTION_FILE=$TASK/k_fold_cv/multi.py
for index in ${!experiments[*]}; do
    for index_l1 in ${!lambda1_options[*]}; do
        for index_wd in ${!wd_options[*]}; do
            for index_lr in ${!lr_options[*]}; do

                # 최대 병렬 프로세스가 다 돌고 있으면 대기
                while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                    echo "Max jobs ($MAX_JOBS) running. Waiting..."
                    sleep 1m
                done

                # GPU 할당 (round-robin)
                GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
                export CUDA_VISIBLE_DEVICES=$GPU_ID

                echo "Launching on GPU $GPU_ID: "
                echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
                $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

                (( COUNTER++ ))
                sleep 5

            done
        done
    done
done


experiments=(

# "--embedding-k=64 --depth=0 --loss-type=naive --base-model=ncf --dataset-name=KuaiRec --batch-size=8192"
# "--embedding-k=64 --loss-type=naive --base-model=mf --dataset-name=KuaiRec --batch-size=8192"

# "--embedding-k=64 --depth=0 --loss-type=ips --base-model=ncf --dataset-name=KuaiRec --batch-size=8192"
# "--embedding-k=64 --loss-type=ips --base-model=mf --dataset-name=KuaiRec --batch-size=8192"

)

lambda1_options=(
    # "--lambda1=2."
    # "--lambda1=1."
    # "--lambda1=0.1"
    # "--lambda1=0.01"
    # "--lambda1=0.001"
)

lambda2_options=(
    # "--lambda2=2."
    "--lambda2=1."
    # "--lambda2=0.1"
    # "--lambda2=0.01"
    # "--lambda2=0.001"
)

EXECUTION_FILE=$TASK/k_fold_cv/escm2.py
for index in ${!experiments[*]}; do
    for index_l2 in ${!lambda2_options[*]}; do
        for index_l1 in ${!lambda1_options[*]}; do
            for index_wd in ${!wd_options[*]}; do
                for index_lr in ${!lr_options[*]}; do

                    # 최대 병렬 프로세스가 다 돌고 있으면 대기
                    while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                        echo "Max jobs ($MAX_JOBS) running. Waiting..."
                        sleep 1m
                    done

                    # GPU 할당 (round-robin)
                    GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
                    export CUDA_VISIBLE_DEVICES=$GPU_ID

                    echo "Launching on GPU $GPU_ID: "
                    echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
                    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

                    (( COUNTER++ ))
                    sleep 5

                done
            done
        done
    done
done



experiments=(

# "--embedding-k=64 --depth=0 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"

)

lambda1_options=(
    # "--lambda1=2."
    # "--lambda1=1."
    # "--lambda1=0.1"
    # "--lambda1=0.01"
    # "--lambda1=0.001"
)

lambda2_options=(
    # "--lambda2=2."
    "--lambda2=1."
    # "--lambda2=0.1"
    # "--lambda2=0.01"
    # "--lambda2=0.001"
)

lambda3_options=(
    # "--lambda3=2."
    "--lambda3=1."
    # "--lambda3=0.1"
    # "--lambda3=0.01"
    # "--lambda3=0.001"
)

EXECUTION_FILE=$TASK/k_fold_cv/ips_v2.py
for index in ${!experiments[*]}; do
    for index_l3 in ${!lambda3_options[*]}; do
        for index_l2 in ${!lambda2_options[*]}; do
            for index_l1 in ${!lambda1_options[*]}; do
                for index_wd in ${!wd_options[*]}; do
                    for index_lr in ${!lr_options[*]}; do

                        # 최대 병렬 프로세스가 다 돌고 있으면 대기
                        while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                            echo "Max jobs ($MAX_JOBS) running. Waiting..."
                            sleep 1m
                        done

                        # GPU 할당 (round-robin)
                        GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
                        export CUDA_VISIBLE_DEVICES=$GPU_ID

                        echo "Launching on GPU $GPU_ID: "
                        echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda3_options[$index_l3]} ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
                        $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda3_options[$index_l3]} ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

                        (( COUNTER++ ))
                        sleep 5

                    done
                done
            done
        done
    done
done



experiments=(

# "--embedding-k=64 --depth=0 --base-model=ncf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"
# "--embedding-k=64 --base-model=mf --dataset-name=KuaiRec --batch-size=8192 --num-epochs=500"

)

lambda1_options=(
    # "--lambda1=2."
    # "--lambda1=1."
    # "--lambda1=0.1"
    # "--lambda1=0.01"
    # "--lambda1=0.001"
)

lambda2_options=(
    # "--lambda2=2."
    "--lambda2=1."
    # "--lambda2=0.1"
    # "--lambda2=0.01"
    # "--lambda2=0.001"
)

lambda3_options=(
    # "--lambda3=2."
    "--lambda3=1."
    # "--lambda3=0.1"
    # "--lambda3=0.01"
    # "--lambda3=0.001"
)

EXECUTION_FILE=$TASK/k_fold_cv/naive_v2.py
for index in ${!experiments[*]}; do
    for index_l3 in ${!lambda3_options[*]}; do
        for index_l2 in ${!lambda2_options[*]}; do
            for index_l1 in ${!lambda1_options[*]}; do
                for index_wd in ${!wd_options[*]}; do
                    for index_lr in ${!lr_options[*]}; do

                        # 최대 병렬 프로세스가 다 돌고 있으면 대기
                        while [ "$(check_jobs)" -ge "$MAX_JOBS" ]; do
                            echo "Max jobs ($MAX_JOBS) running. Waiting..."
                            sleep 1m
                        done

                        # GPU 할당 (round-robin)
                        GPU_ID=$(( COUNTER % 4 ))   # 0,1,2,3 반복
                        export CUDA_VISIBLE_DEVICES=$GPU_ID

                        echo "Launching on GPU $GPU_ID: "
                        echo $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda3_options[$index_l3]} ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT 
                        $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda3_options[$index_l3]} ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]} --cv-restrict=$CV_RESTRICT &

                        (( COUNTER++ ))
                        sleep 5

                    done
                done
            done
        done
    done
done
