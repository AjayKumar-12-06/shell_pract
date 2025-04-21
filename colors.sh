#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root(){
    if [ $USERID -ne 0 ]; then
        echo -e " $R u must have the sudo access to execute this $N"
        exit 1
    fi
}

check_root

validate(){
    if [ $1 -ne 0 ]; then
        echo -e " $2 installing $R failure $N"
        exit 1
    else
        echo -e "$2 installing $G success $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "mysql is not installed, going to installing mysql"
        dnf install mysql -y
        validate $? "installing mysql"
else
    echo -e "mysql already installed $Y Skkipping $N"
fi