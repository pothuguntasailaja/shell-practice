#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]; then
    echo "please run this script by root privilege"
fi    

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "not installed .... $R FAILURE $N"
else 
    echo "already installed ... $G SUCESS $N"    
    