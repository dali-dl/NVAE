
export EXPR_ID=UNIQUE_EXPR_ID
export DATA_DIR=PATH_TO_DATA_DIR
export CHECKPOINT_DIR=PATH_TO_CHECKPOINT_DIR
export CODE_DIR=PATH_TO_CODE_DIR
export IP_ADDR=IP_ADDRESS
export NODE_RANK=NODE_RANK_BETWEEN_0_TO_2
cd $CODE_DIR
mpirun --allow-run-as-root -np 3 -npernode 1 bash -c \
        'python train.py --data $DATA_DIR/imagenet-oord/imagenet-oord-lmdb_32 --root $CHECKPOINT_DIR --save $EXPR_ID --dataset imagenet_32 \
        --num_channels_enc 192 --num_channels_dec 192 --epochs 45 --num_postprocess_cells 2 --num_preprocess_cells 2 \
        --num_latent_scales 1 --num_latent_per_group 20 --num_cell_per_cond_enc 2 --num_cell_per_cond_dec 2 \
        --num_preprocess_blocks 1 --num_postprocess_blocks 1 --num_groups_per_scale 28 \
        --batch_size 24 --num_nf 1 --warmup_epochs 1 \
        --weight_decay_norm 1e-2 --weight_decay_norm_anneal --weight_decay_norm_init 1e0 \
        --num_process_per_node 8 --use_se --res_dist \
        --fast_adamax --node_rank $NODE_RANK --num_proc_node 3 --master_address $IP_ADDR '