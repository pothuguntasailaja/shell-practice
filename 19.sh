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
