#!/bin/bash
# Run RONN for each FASTA file in the FASTA_DIR and append the result to out.txt


FASTA_DIR=$1
RONN_DIR=$2

for file in $FASTA_DIR/*; 
do
  if ! grep -Fxq "${file##*/}" out.txt
  then
    echo $file
    echo ${file##*/} >> $RONN_DIR/nohup.out
    java -jar $RONN_DIR/JRONN.jar -i=$file >> $RONN_DIR/out.txt
  fi
done


