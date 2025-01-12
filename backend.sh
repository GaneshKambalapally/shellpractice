#!/bin/bash/

#to get userid and name
USERID=$(id -u)
mkdir -p  /var/log/mysqlserver
LOG_FOLDER="/var/log/mysqlserver"
SCRIPT_NAME=$(echo $0 | cut -d "." "-f1")
TIME=$(date +%F-%H-%M-%S)
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
#checking the installed version packeges of nodejs
dnf list installed nodejs
if [ $? -ne 0 ]
then
echo "installing nodejs"
else
      echo "already installed nodejs"
 fi

dnf install nodejs:20 -y
VALIDATION $? "failed installation of nodejs:20" "installed nodejs:20 successfully"
