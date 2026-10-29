#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "please run the script as root privileges" 
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "mysql installation is failed"
    exit 1
else
echo "mysql installation is sucess"
fi