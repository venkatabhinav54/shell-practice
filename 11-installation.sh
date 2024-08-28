#!/bin/bash

USERID=$(id -u)
 #echo "User id is: $USERID"

if [ $USERID -ne 0 ]
then 
     echo "PLease run this script with root priveleges"
     exit 1
fi

dnf install git -y