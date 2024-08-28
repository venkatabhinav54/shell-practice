#!/bin/bash

USERID=$(id -u)
 #echo "User id is: $USERID"

 VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else 
        echo "$2 is...SUCCESS"
    fi        
 }

if [ $USERID -ne 0 ]
then 
     echo "PLease run this script with root priveleges"
     exit 1
fi

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