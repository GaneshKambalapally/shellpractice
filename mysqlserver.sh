#!/bin/bash

#to get userid and name
USERID=$(id -u)


#check root user or not
CHECK_ROOT(){

    if [ $USERID -ne 0 ]
    then 
    echo "Proceed executing the script with root user acces::Example Sudo Script.sh"
    else
    echo "Running the script with Root user access on $date"
    fi 
}

CHECK_ROOT

#installation of mysql
 #check whether mysql already installed
 dnf list installed mysqld