#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
     echo "ERROR:: Please run this script with root Privelege"
fi


dnf install mysql -y

if [ $? -ne 0 ]; then
     echo "ERROR:: Installaing MYSQL is Failure"
else
    echo "Installing MYSQL is SUCCESS"
