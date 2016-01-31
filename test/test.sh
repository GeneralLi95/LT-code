#!/bin/bash
REALDIR=$(dirname $0)
DATA=$REALDIR/data/README.txt
OUT=$REALDIR/out
ENCODER=$REALDIR/../encoder
DECODER=$REALDIR/../decoder

BLOCK_SIZE=64
DROP_RATE=0

if [ ! -d $OUT ];
then
    mkdir -p $OUT;
else
    rm $OUT/*
fi


echo "Encoding file $DATA"
$ENCODER $DATA $BLOCK_SIZE  | $DECODER $DROP_RATE > $OUT/decoded 
echo "Verifying data <=> decoded"

if [[ -z $(diff $DATA $OUT/decoded) ]];
    then
        echo "Test passed!"
    else
        echo "Test Failed!"
    fi
