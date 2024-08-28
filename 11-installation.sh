#!/bin/bash

USERID=$(id -u)
 #echo "User id is: $USERID"

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
else 
    echo "Git is already installed, nothing to do..."
fi        