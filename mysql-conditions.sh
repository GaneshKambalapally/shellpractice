#!/bin/bash

#check user access
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
   echo "Run the script with Root user access/prvilaged access"

   else
     echo "Running the script as a Root user"
     fi

     dnf list installed mysql
     if [ $? -e 0 ]
     then
     echo "Mysql is already installed in system"
     else
     echo "starting the installion of mysql"
     fi