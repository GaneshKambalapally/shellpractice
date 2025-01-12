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
#installing nodejs:20
dnf module install nodejs:20 -y
VALIDATION $? "failed installation of nodejs:20" "installed nodejs:20 successfully"

#adding user to it
useradd expense

#create directory
mkdir app

#download backend code

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

# go to app folder
cd /app

#unzip the file
unzip /tmp/backend.zip

cd /app

#install npm
npm install

cp /root/shellpractice/backend.service /etc/systemd/system/backend.service

systemctl daemon-reload

systemctl start backend

systemctl enable backend

#install mysql client
dnf install mysql -y

#set password for mysql
mysql -h 172.31.92.28 -uroot -pExpenseApp@1 < /schema/backend.sql

#restart service
systemctl restart backend


