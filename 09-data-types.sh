#!/bin/bash

# everything in shell is considered as string
NUMBER1=100
NUMBER2=200
NAME=Devops

SUM=$(($NUMBER1+$NUMBER2))

echo "SUM is: ${SUM}"

# size=4, max index = 3

LEADERS=("Modi" "Putin" "Trudo" "Trump")

echo "All leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADER[0]}"