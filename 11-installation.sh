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

    if [ $? -ne 0 ]
    then 
        echo "Git installation is not success..."
    else 
        echo "Git installation is success..."     
    fi   
else 
    echo "Git is already installed, nothing to do..."
fi     

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed... going to installe it"
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo " mysql installation is failure.. please check it"
        exit 1 
    else 
        echo "mysql installation is success"
    fi
else 
    echo "mysql is already installed...nothing to do"
fi                