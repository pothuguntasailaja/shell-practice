#!/bin/bash

USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FILE="/var/log/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FOLDER="$LOG_FILE/$SCRIPT_NAME.log"

if [ $USER_ID -ne 0 ]; then
    echo "please run this script as root privileges"
    exit 1
fi
  

VALIDATE(){
    if [ $1  -ne 0 ]; then
       echo "$2 installation.... is $R failed $N"
       exit 1
    else
      echo "$2 installation..... is $G success $N"
    fi   
}


dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "MYSQL"
else
   echo "mysql is already installed  $Y SKIPPING $N" 
fi


dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "NGINX"
else
   echo "nginx is already installed  $Y SKIPPING $N" &>>$LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "PYTHON"
else
   echo "python3 is already installed  $Y SKIPPING $N" &>>$LOG_FILE
fi