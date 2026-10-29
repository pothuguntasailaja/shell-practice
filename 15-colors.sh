#!/bin/bash

USER_ID=$(id -u) # get the user id of the current user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then 
    echo "please run this script as root privilege"
    exit 1 # failure exit status
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then  # check the exit status of the last command
        echo -e "$2 installation is $R FAILURE.... $N"
        exit 1
    else
        echo -e "$2 installation is $G SUCCESS.... $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0]; then
   dnf install mysql -y
   VALIDATE $? "MYSQL"
else
   echo -e "MYSQL is Already INSTALLED $Y SKIPPING..... $N"   
fi   

dnf list installed nginx
if [ $? -ne 0 ]; then
   dnf install nginx -y
   VALIDATE $? "NGINX"
else
   echo -e "NGINX is Already INSTALLED $Y SKIPPING..... $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
   dnf install python3 -y
   VALIDATE $? "PYTHON"
else
   echo -e "PYTHON is Already INSTALLED $Y SKIPPING..... $N"
fi