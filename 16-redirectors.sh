#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(DATE +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER 

USERID=$(id -u) #echo "User id is: $USERID"
 
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


 CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privelleges $N" &>>$LOG_FILE
        exit 1
    fi    
 }

 VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is... $R FAILED $N" &>>$LOG_FILE
        exit 1
    else 
        echo -e "$2 is...$G SUCCESS $N" &>>$LOG_FILE
    fi        
 }

CHECK_ROOT

#sh 15-loops.sh git mysql postfix nginx
for package in $@
do 
  dnf list installed $package
  if [ $? -ne 0 ]
  then 
      echo "$package is not installed, going to installed it...."
      dnf install $package -y

      VALIDATE $? "Installing $pacakge"
   else
       echo "$package is already installed .. nothing to do"
   fi 
done 