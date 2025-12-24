#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]; then
    echo "please run this script by root privilege"
    exit 1
fi    

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo -e "not installed .... $R FAILURE $N"
    exit 1
else 
    echo -e "already installed ... $G SUCESS $N"    
fi