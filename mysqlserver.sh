#!/bin/bash

#to get userid and name
USERID=$(id -u)
mkdir -p  /var/log/mysqlserver
LOG_FOLDER="/var/log/mysqlserver"
SCRIPT_NAME=$(echo $0 | cut -d "." "-f1")
TIME=$(date +%F)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

#check root user or not
CHECK_ROOT(){

    if [ $USERID -ne 0 ]
    then 
    echo -e "Proceed executing the script with root user acces::$R Example Sudo Scriptname.sh$N"
    exit 1
    else
    echo "Running the script with Root user access on $date"
    fi 
}

VALIDATION(){

    if [ $1 -ne 0 ]
    then
 echo -e "$R Command failure....$N $2"
 exit 1
 else
 echo -e "$G Command success....$N $3"
 fi

}

CHECK_ROOT

#installation of mysql
 #check whether mysql already installed
 dnf list installed mysqld & >>$LOG_FILE
 if [ $? -ne 0 ]
 then
 echo "Mysql already installed"
 else
 echo "Mysql not installed....starting installation of mysql..."
 fi
 
 #installation of mysql-server
 dnf install mysql-server -y & >>$LOG_FILE
 VALIDATION $? "package not installed"  "package installed"

 #enable mysql server
 systemctl enable mysqld & >>$LOG_FILE
 VALIDATION $? "package not enabled"  "package enabled"

#  #start mysql server
 systemctl start mysqld & >>$LOG_FILE
 VALIDATION $? "mysql not started"  "mysql started"

 #check status of server
 systemctl status mysqld|grep "active"

 #setting up the root user to mysql
 mysql_secure_installation --set-root-pass ExpenseApp@1 & >>$LOG_FILE
 VALIDATION $?

 #login to mysql client
 mysql
 VALIDATION $?

 #show databes;
 show databases;


