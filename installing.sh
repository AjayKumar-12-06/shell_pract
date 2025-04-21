#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must have the sudo access to execute this"
    exit 1
fi

dnf list installed git
echo "git is not available, now it's going to install mysql"

    if [ $? -ne 0 ]; then
        dnf install git -y
            if [ $? -ne 0 ]; then
                echo "git installing failure"
                exit 1
            else
                echo "git installing success"
            fi
    else
        echo "git already installed"
    fi
