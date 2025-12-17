#!/bin/bash

echo "please enter the number:"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
     echo "Given number $NUMBER is a even number"
else
       echo "Given number $NUMBER is a odd number"
fi         
