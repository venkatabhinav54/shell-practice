#!/bin/bash

USERID=$(id -u)
 #echo "User id is: $USERID"

if [ $USERID -ne 0 ]
then 
     echo "PLease run this script with root priveleges"
fi

dnf install git -y