#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must have the sudo access to execute this"
    exit 1
fi

dnf list installed java
if [ $? -ne 0 ]; then
echo "java is not available, now it's going to install java"
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

# dnf list installed mysql-server
# if [ $? -ne 0 ]; then
#     echo "MySQL is not installed. Installing MySQL..."
#     dnf install mysql-server -y
# else
#     echo "MySQL is already installed."
# fi
