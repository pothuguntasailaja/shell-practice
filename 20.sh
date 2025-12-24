#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]; then
    echo "please run this script by root privilege"
    exit 1
fi    


VALIDATE(){
    if [ $1 -ne 0 ]; then 
    echo -e "not  installed $2 .... $R FAILURE $N"
    exit 1
else 
    echo -e "already installed $2 .... $G SUCESS $N"    
fi
}
dnf list installed mysql

if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
    echo -e "already installed.... $Y SKIPPING $N"
fi 

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo -e "already installed.... $Y SKIPPING $N"
fi 

dnf list installed python3 
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "already installed.... $Y SKIPPING $N"    
fi    