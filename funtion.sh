#!/bin/bash

USERID=$(id -u)

check_root (){
    if [ $USERID -ne 0 ]; then
        echo "you have must have sudo access to excute this"
        exit 1
    fi
}

check_root

vaidate (){
    if [ $1 -ne 0 ]; then
        echo " $2 installing failure"
        exit 1
    else
        echo " $2 installing success"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
echo "mysql is not installed, going to installing mysql"
    dnf install mysql -y
        if [ $? -ne 0 ]; then
            validate $? "installing mysql"
else
    echo "mysql already installed"
fi