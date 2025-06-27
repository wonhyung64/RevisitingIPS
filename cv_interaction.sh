#!/bin/bash
#srun --cpus-per-task=48 -p gpu6 --gres=gpu:a10:4 --pty bash


TASK=interaction
# ENV=python
ENV=/home1/wonhyung64/anaconda3/envs/openmmlab/bin/python3
RANDOM_SEED=0

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

lambda1_options=(
    "--lambda1=2."
    "--lambda1=1."
    "--lambda1=0.1"
    "--lambda1=0.01"
    "--lambda1=0.001"
)

lambda2_options=(
    "--lambda2=2."
    "--lambda2=1."
    "--lambda2=0.1"
    "--lambda2=0.01"
    "--lambda2=0.001"
)

lambda3_options=(
    "--lambda3=2."
    "--lambda3=1."
    "--lambda3=0.1"
    "--lambda3=0.01"
    "--lambda3=0.001"
)


experiments=(
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"
)
EXECUTION_FILE=$TASK/k_fold_cv/ips.py
for index in ${!experiments[*]}; do
    for index_wd in ${!wd_options[*]}; do
        for index_lr in ${!lr_options[*]}; do
            $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]}
        done
    done
done


experiments=(
# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192 --G=1 --lr2=0.05 --lr3=0.05 --J=3 --gamma=1. --C=1e-5 --lamb2=0. --lamb3=0."
)
EXECUTION_FILE=$TASK/k_fold_cv/akb_ips.py
for index in ${!experiments[*]}; do
    for index_wd in ${!wd_options[*]}; do
        for index_lr in ${!lr_options[*]}; do
            $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]}
        done
    done
done



experiments=(

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"

)
EXECUTION_FILE=$TASK/k_fold_cv/naive.py
for index in ${!experiments[*]}; do
    for index_wd in ${!wd_options[*]}; do
        for index_lr in ${!lr_options[*]}; do
            $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${wd_options[$index_wd]} ${lr_options[$index_lr]}
        done
    done
done


experiments=(

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"

)

EXECUTION_FILE=$TASK/k_fold_cv/esmm.py
for index in ${!experiments[*]}; do
    for index_l1 in ${!lambda1_options[*]}; do
        for index_wd in ${!wd_options[*]}; do
            for index_lr in ${!lr_options[*]}; do
                $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]}
            done
        done
    done
done


experiments=(

# "--depth=2 --loss-type=naive --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --loss-type=naive --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"
# "--depth=2 --loss-type=ips --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --loss-type=ips --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"

)
EXECUTION_FILE=$TASK/k_fold_cv/multi.py
for index in ${!experiments[*]}; do
    for index_l1 in ${!lambda1_options[*]}; do
        for index_wd in ${!wd_options[*]}; do
            for index_lr in ${!lr_options[*]}; do
                $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]}
            done
        done
    done
done


experiments=(

# "--depth=2 --loss-type=naive --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --loss-type=naive --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"
# "--depth=2 --loss-type=ips --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --loss-type=ips --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"

)
EXECUTION_FILE=$TASK/k_fold_cv/escm2.py
for index in ${!experiments[*]}; do
    for index_l2 in ${!lambda2_options[*]}; do
        for index_l1 in ${!lambda1_options[*]}; do
            for index_wd in ${!wd_options[*]}; do
                for index_lr in ${!lr_options[*]}; do
                    $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]}
                done
            done
        done
    done
done


experiments=(

# "--depth=2 --base-model=ncf --dataset-name=coat --batch-size=4096"
# "--depth=2 --base-model=ncf --dataset-name=yahoo_r3 --batch-size=8192"

)
EXECUTION_FILE=$TASK/k_fold_cv/ips_v2.py
for index in ${!experiments[*]}; do
    for index_l3 in ${!lambda3_options[*]}; do
        for index_l2 in ${!lambda2_options[*]}; do
            for index_l1 in ${!lambda1_options[*]}; do
                for index_wd in ${!wd_options[*]}; do
                    for index_lr in ${!lr_options[*]}; do
                        $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda3_options[$index_l3]} ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]}
                    done
                done
            done
        done
    done
done


EXECUTION_FILE=$TASK/k_fold_cv/naive_v2.py
for index in ${!experiments[*]}; do
    for index_l3 in ${!lambda3_options[*]}; do
        for index_l2 in ${!lambda2_options[*]}; do
            for index_l1 in ${!lambda1_options[*]}; do
                for index_wd in ${!wd_options[*]}; do
                    for index_lr in ${!lr_options[*]}; do
                        $ENV $EXECUTION_FILE ${experiments[$index]} --data-dir=$TASK/data --random-seed=$RANDOM_SEED ${lambda3_options[$index_l3]} ${lambda2_options[$index_l2]} ${lambda1_options[$index_l1]} ${wd_options[$index_wd]} ${lr_options[$index_lr]}
                    done
                done
            done
        done
    done
done
