#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))
MUL=$(($NUMBER1*$NUMBER2))
DEV=$(($NUMBER1/$NUMBER2))

echo "Total of $NUMBER1 and $NUMBER2 is: $SUM"

echo "Multiple of $NUMBER1 and $NUMBER2 is: $MUL"

echo "Devide by $NUMBER1 and $NUMBER2 is: $DEV"