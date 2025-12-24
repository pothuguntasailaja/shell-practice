#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]; then
    echo "please run this script by root privilege"
    exit 1
fi    

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE=$LOGS_FOLDER/$SCRIPT_NAME.log
 
mkdir -p $LOGS_FOLDER
echo "script started executed at: $(date)" | tee -a $LOG_FILE

VALIDATE(){
    if [ $1 -ne 0 ]; then 
    echo -e "not  installed $2 .... $R FAILURE $N" | tee -a $LOG_FILE
    exit 1
else 
    echo -e "already installed $2 .... $G SUCESS $N" | tee -a $LOG_FILE   
fi
}
dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else 
    echo -e "already installed.... $Y SKIPPING $N" | tee -a $LOG_FILE
fi 

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo -e "already installed.... $Y SKIPPING $N" | tee -a $LOG_FILE
fi 

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "already installed.... $Y SKIPPING $N"  | tee -a $LOG_FILE  
fi    