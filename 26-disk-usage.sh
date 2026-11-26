#!/bin/bash


DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # in projects we keep it as 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4) # OKA SERVER DWARA NE GA RUN MAIL OSTHADI
MESSAGE=" "

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print $7}')
   if [ $USAGE -ge $DISK_THRESHOLD ]; then
       MESSAGE+="High usage on $PARTITION: $USAGE % \n"
   fi
 
done <<< "$DISK_USAGE"


echo -e "Message Body: $MESSAGE"

sh mail.sh "pothuguntasailaja123@gmail.com" "high disk usage alert" "high disk usage" "$MESSAGE" "$IP_ADDRESS"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5