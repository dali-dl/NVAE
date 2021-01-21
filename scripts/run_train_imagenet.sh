#!/bin/bash

export EXPR_ID=0120
export DATA_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/data'
export CHECKPOINT_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/ckpt'
export IP_ADDR='127.0.0.1'
export NODE_RANK=0
cd ..
mpirun --allow-run-as-root -np 1 -npernode 1 bash -c \
        'python3 train.py --data $DATA_DIR/imagenet-oord/imagenet-oord-lmdb_32 --root $CHECKPOINT_DIR --save $EXPR_ID --dataset imagenet_32 \
        --num_channels_enc 192 --num_channels_dec 192 --epochs 45 --num_postprocess_cells 2 --num_preprocess_cells 2 \
        --num_latent_scales 1 --num_latent_per_group 20 --num_cell_per_cond_enc 2 --num_cell_per_cond_dec 2 \
        --num_preprocess_blocks 1 --num_postprocess_blocks 1 --num_groups_per_scale 28 \
        --batch_size 24 --num_nf 1 --warmup_epochs 1 \
        --weight_decay_norm 1e-2 --weight_decay_norm_anneal --weight_decay_norm_init 1e0 \
        --num_process_per_node 8 --use_se --res_dist \
        --fast_adamax --node_rank $NODE_RANK --num_proc_node 3 --master_address $IP_ADDR '