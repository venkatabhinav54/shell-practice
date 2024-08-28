#!/bin/bash

USERID=$(id -u)
 #echo "User id is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"


 CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privelleges"
        exit 1
    fi    
 }

 VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is... $R FAILED $N"
        exit 1
    else 
        echo -e "$2 is...$G SUCCESS $N"
    fi        
 }

CHECK_ROOT

dnf list installed git
if [ $? -ne 0 ]
then
    echo "Git is not installed, going to installed it...."
    dnf install git -y

    VALIDATE $? "Installing git"

else 
    echo "Git is already installed, nothing to do..."
fi     

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed... going to installe it"
    dnf install mysql -y 
    VALIDATE $? "Installed MYSQL"
else 
    echo "mysql is already installed...nothing to do"
fi                