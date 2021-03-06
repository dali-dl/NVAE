#!/bin/bash

sleep 20m 30s
export EXPR_ID=0122
export DATA_DIR='/group-volume/orc_sruk/users/da.li1/git/NVAE/data'
export CHECKPOINT_DIR='/group-volume/orc_sruk/users/da.li1/git/NVAE/ckpt'
cd ..
python3 train.py --data $DATA_DIR/mnist --root $CHECKPOINT_DIR --save $EXPR_ID --dataset mnist --batch_size 200 \
        --epochs 400 --num_latent_scales 2 --num_groups_per_scale 10 --num_postprocess_cells 3 --num_preprocess_cells 3 \
        --num_cell_per_cond_enc 2 --num_cell_per_cond_dec 2 --num_latent_per_group 20 --num_preprocess_blocks 2 \
        --num_postprocess_blocks 2 --weight_decay_norm 1e-2 --num_channels_enc 32 --num_channels_dec 32 --num_nf 0 \
        --ada_groups --num_process_per_node 2 --use_se --res_dist --fast_adamax