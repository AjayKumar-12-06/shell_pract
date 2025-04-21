#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must have the sudo access to execute this"
    exit 1
fi

dnf list installed mysql
echo "git is not available, now it's going to install mysql"

    if [ $? -ne 0 ]; then
        dnf install mysql -y
            if [ $? -ne 0 ]; then
                echo "mysql installing failure"
                exit 1
            else
                echo "mysql installing success"
            fi
    else
        echo "mysql already installed"
    fi
