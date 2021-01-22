#!/bin/bash

export EXPR_ID=0122
export DATA_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/data'
export CHECKPOINT_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/ckpt'
export CODE_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/'
cd $CODE_DIR
python3 train.py --data $DATA_DIR/celeba/celeba-lmdb --root $CHECKPOINT_DIR --save $EXPR_ID --dataset celeba_256 \
        --num_channels_enc 30 --num_channels_dec 30 --epochs 300 --num_postprocess_cells 2 --num_preprocess_cells 2 \
        --num_latent_scales 5 --num_latent_per_group 20 --num_cell_per_cond_enc 2 --num_cell_per_cond_dec 2 \
        --num_preprocess_blocks 1 --num_postprocess_blocks 1 --weight_decay_norm 1e-2 --num_groups_per_scale 16 \
        --batch_size 4 --num_nf 2 --ada_groups --min_groups_per_scale 4 \
        --weight_decay_norm_anneal --weight_decay_norm_init 1. --num_process_per_node 4 --use_se --res_dist \
        --fast_adamax --num_x_bits 5