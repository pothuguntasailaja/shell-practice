#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root Privelege"
     exit 1 # failure is other than 0
fi

VALIDATE (){
    if [ $1 -ne 0 ]; then
         echo -e " Installaing $2 .... $R Failure $N"
         exit 1
    else
         echo -e "Installing $2 .... $G SUCCESS $N"
    fi

}
# how to check wheather installed or not  this cmd is used
dnf list installed mysql 

# install if it is not found
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL already exist ... $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "NGINX already exist... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0]; then
     dnf install python3 -y
     VALIDATE $? "PYTHON3"
else
    echo -e "PYTHON3 already exist... $Y SKIPPING $N"     
fi