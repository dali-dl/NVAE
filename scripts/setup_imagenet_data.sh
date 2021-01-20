#!/bin/bash

export DATA_DIR='/group-volume/orc_sruk/users/da.li1/git/NVAE/data'
mkdir -p $DATA_DIR/imagenet-oord
cd $DATA_DIR/imagenet-oord
wget https://storage.googleapis.com/glow-demo/data/imagenet-oord-tfr.tar
tar -xvf imagenet-oord-tfr.tar

python3 convert_tfrecord_to_lmdb.py --dataset=imagenet-oord_32 --tfr_path=$DATA_DIR/imagenet-oord/mnt/host/imagenet-oord-tfr --lmdb_path=$DATA_DIR/imagenet-oord/imagenet-oord-lmdb_32 --split=train
python3 convert_tfrecord_to_lmdb.py --dataset=imagenet-oord_32 --tfr_path=$DATA_DIR/imagenet-oord/mnt/host/imagenet-oord-tfr --lmdb_path=$DATA_DIR/imagenet-oord/imagenet-oord-lmdb_32 --split=validation