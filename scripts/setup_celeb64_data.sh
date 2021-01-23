#!/bin/bash

#export http_proxy="http://75.12.251.5:8080"
#export https_proxy="http://75.12.251.5:8080"
#export ftp_proxy="ftp://75.12.251.5:8080"
#export no_proxy="127.0.0.1, localhost, 192.168.20.45, 75.17.101.8, 75.17.101.5, 75.17.101.45"

export DATA_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/data'
export CODE_DIR='/group-volume/ASR-Unlabeled-Data/users/da.li1/git/NVAE/'
cd $CODE_DIR/scripts
python3 create_celeba64_lmdb.py --split train --img_path $DATA_DIR/celeba_org --lmdb_path $DATA_DIR/celeba64_lmdb
python3 create_celeba64_lmdb.py --split valid --img_path $DATA_DIR/celeba_org --lmdb_path $DATA_DIR/celeba64_lmdb
python3 create_celeba64_lmdb.py --split test  --img_path $DATA_DIR/celeba_org --lmdb_path $DATA_DIR/celeba64_lmdb