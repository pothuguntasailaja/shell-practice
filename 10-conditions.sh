#!/bin/bash


NUMBER1=$1

if[$NUMBER -lt 10]; then
    echo "the number is $NUMBER is less than 10"
    elif[$NUMBER -eq 10]; then
    echo "the number $NUMBER is equal to 10"
    else
    echo "the number $NUMBER is greater than 10"
fi    
