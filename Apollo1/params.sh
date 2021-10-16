#!/bin/bash

# awk 'BEGIN {printf "#N canvas 0 10 350 400 12;\n"} {printf "#X obj 10 %d param.get %d %s;\n",n*22,n,$1;n++}' <(awk '{sub("-set","",$1);print $1}' Apollo1/default.txt) > Apollo1/param.util.pd

DEFAULT=Apollo1/default.txt
FILE=Apollo1/param.util.pd-test

printf "#N canvas 0 10 350 400 12;\n" > $FILE
echo -n > /tmp/params
n=0
while read line
do
  FIELD=$(echo $line | cut -f 1 -d ' ')
  printf "#X obj 10 %d param.get %d %s;\n" $((n*22)) $n ${FIELD/-set/} >> $FILE
  ((n++))
done < $DEFAULT
