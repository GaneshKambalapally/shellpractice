#!/bin/bash

#to get userid and name
USERID=$(id -u)


#check root user or not
CHECK_ROOT(){

    if [ $USERID -ne 0 ]
    then 
    echo "Proceed executing the script with root user acces::Example Sudo Script.sh"
    exit 1
    else
    echo "Running the script with Root user access on $date"
    fi 
}

VALIDATION(){

    if [ $1 -ne 0 ]
    then
 echo "Command failure....$2"
 exit 1
 else
 echo "Command success....$3"
 fi

}

CHECK_ROOT

#installation of mysql
 #check whether mysql already installed
 dnf list installed mysqld
 if [ $1 -ne 0 ]
    then
 echo "Mysql not installed....starting installation of mysql"
 else
 echo "Mysql already installed..."
 fi
 
 #installation of mysql-server
 dnf install mysql-server -y
 VALIDATION $? "package not installed"  "package installed"

 #enable mysql server
 systemctl enable mysqld
 VALIDATION $? "package not enabled"  "package enabled"

#  #start mysql server
 systemctl start mysqld
 VALIDATION $? "mysql not started"  "mysql started"

 #check status of server
 systemctl status mysqld|grep "dead"
 VALIDATION $? "mysql is not active"  "mysql is active"


