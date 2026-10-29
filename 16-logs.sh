#!/bin/bash

USER_ID=$(id -u) # get the user id of the current user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOGS_FOLDER
echo "Logs will be stored in $LOG_FILE"
echo "Script started execution at $(date)"

if [ $USER_ID -ne 0 ]; then 
    echo "please run this script as root privilege"
    exit 1 # failure exit status
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then  # check the exit status of the last command
        echo -e "$2 installation is $R FAILURE.... $N"  &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 installation is $G SUCCESS.... $N" &>>$LOG_FILE
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "MYSQL"
else
   echo -e "MYSQL is Already INSTALLED $Y SKIPPING..... $N" &>>$LOG_FILE
fi   

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "NGINX"
else
   echo -e "NGINX is Already INSTALLED $Y SKIPPING..... $N"
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "PYTHON"
else
   echo -e "PYTHON is Already INSTALLED $Y SKIPPING..... $N"
fi