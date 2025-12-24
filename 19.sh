#!/bin/bash

echo "hi,iam learning shell"


person1=10
echo "print the value of $person1"

person2=$1
echo "print the value of $person2"


person3=ram
person4=sita

echo "$person3:: hi, $person4"
echo "$person4:: hello, $person3"
echo "$person3:: which course u are learning $person4"
echo "$person4:: iam learning shell $person3"


person3=$2
person4=$3

echo "$person3:: hi, $person4"
echo "$person4:: hello, $person3"
echo "$person3:: which course u are learning $person4"
echo "$person4:: iam learning shell $person3"

echo "please enter ur pin number"
read -s PIN_NUMBER
echo "entered pin number is $PIN_NUMBER"



echo "Course name is : $COURSE"

START_TIME=$(date +%s)
sleep 10
END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "total time taken is $TOTAL_TIME"


number1=100
number2=300

total=$(($number1+$number2))

echo "the sum of 2 numbers is: $total"
