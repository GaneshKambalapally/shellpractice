#!/bin/bash

#check user access
USERID=$(id -u)
DATE=$(date+%F)
echo "Running the script on $DATE"
echo "Running as $uname"

if [ $USERID -ne 0 ]
then 
   echo "Run the script with Root user access/prvilaged access"

   else
     echo "Running the script as a Root user"
     fi

     dnf list installed mysql
     if [ $? -eq 0 ]
     then
     echo "Mysql is already installed in system"
     else
     echo "starting the installion of mysql"
     fi

     dnf install mysql -y
     if [ $? -eq 0 ]
     then
     echo "Mysql is installation is SUCCESS in system"
     else
     echo "installation failed"
     exit 1
     fi