#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must have the sudo access to execute this"
    exit 1
fi

dnf list installed java
echo "java is not available, now it's going to install java"

    if [ $? -ne 0 ]; then
        dnf install java -y
            if [ $? -ne 0 ]; then
                echo "java installing failure"
                exit 1
            else
                echo "java installing success"
            fi
    else
        echo "java already installed"
    fi
