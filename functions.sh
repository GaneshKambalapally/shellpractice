#!/bin/bash
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo "RUn the script with root access"
    else
    echo "running the script"
    fi
}
VALIDATE()
{
if [ $1 -eq 0 ]
then
echo "command success...$2"
else
echo "command failure.."
exit 1
fi

}

CHECK_ROOT

dnf list installed mysql
if [ $? -ne 0 ]
then
echo "Installing mysql"
else
echo "Mysql is already installed"
exit 1
fi

dnf install mysql -y
VALIDATE $? "installing mysql"
