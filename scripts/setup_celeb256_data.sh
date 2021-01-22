#!/bin/bash

export DATA_DIR='/vol1/dbstore/orc_sruk/users/da.li1/git/NVAE/data'
export CODE_DIR='/vol1/dbstore/orc_sruk/users/da.li1/git/NVAE/'
#mkdir -p $DATA_DIR/celeba
#cd $DATA_DIR/celeba
#wget https://storage.googleapis.com/glow-demo/data/celeba-tfr.tar
#tar -xvf celeba-tfr.tar
cd $CODE_DIR/scripts
python3 convert_tfrecord_to_lmdb.py --dataset=celeba --tfr_path=$DATA_DIR/celeba/celeba-tfr --lmdb_path=$DATA_DIR/celeba/celeba-lmdb --split=train
python3 convert_tfrecord_to_lmdb.py --dataset=celeba --tfr_path=$DATA_DIR/celeba/celeba-tfr --lmdb_path=$DATA_DIR/celeba/celeba-lmdb --split=validation