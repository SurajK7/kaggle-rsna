#!/usr/bin/env bash

pip install --upgrade pip
CUR_DIR=$pwd
DATA_DIR_LOC=dataset

cd ..
mkdir -p $DATA_DIR_LOC
cd $DATA_DIR_LOC

if [ "$(ls -A $(pwd))" ]
then
    echo "$(pwd) not empty!"
else
    echo "$(pwd) is empty!"
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=12KPZ-ypaBlnOKCwAJpQhnEtwh8yirvZt' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=12KPZ-ypaBlnOKCwAJpQhnEtwh8yirvZt" -O rsna-pneumonia-detection-challenge.zip && rm -rf /tmp/cookies.txt
    unzip rsna-pneumonia-detection-challenge.zip
    mv stage_2_train_images train
    mv stage_2_test_images test
    rm rsna-pneumonia-detection-challenge.zip
fi

cd $CUR_DIR
echo $(pwd)
