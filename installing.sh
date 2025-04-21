#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]; then
    echo "You must have the sudo access to execute this"
    exit
fi

dnf list installed mysql
echo "mysql is not available, now it's going to inbstall mysql "

    if[ $? -ne 0 ]; then
        dnf install mysql -y
            if [ $? -ne 0 ]; then
                echo "Mysql installing failure"
                exit 1
            else
                echo "mysql installing success"
            fi
    elif
        echo "mysql already installed"
    fi
