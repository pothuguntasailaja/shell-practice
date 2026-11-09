#!/bin/bash

USER_ID=$(id -u) # get the user id of the current user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$!
DEST_DIR=$2
 ##DAYS=${3:-14} # IF NOT PROVIDED CONSIDERED AS 14 DAYS

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"


mkdir -p $LOGS_FOLDER
echo "Logs will be stored in $LOG_FILE" | tee -a $LOG_FILE
echo "Script started execution at $(date)" | tee -a $LOG_FILE

if [ $USER_ID -ne 0 ]; then 
    echo "please run this script as root privilege"
    exit 1 # failure exit status
fi

USAGE(){
    echo -e "$R  USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> $N"
###    echo -e "$R  USAGE:: sudo sh 24-backup-script.sh <SOURCE_DIR> <DEST_DIR> $N"
    exit 1
}

### check SOURCE_DIR and DEST_DIR passed or not ###
if [ $# -lt 2 ]; then
    USAGE
fi    

### check SOURCE_DIR exist #####

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R source $SOURCE_DIR does not exist $N"
fi

#### FIND THE FILES ####
# FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)
FILES=$(find $SOURCE_DIR -name "*.log" -type f )