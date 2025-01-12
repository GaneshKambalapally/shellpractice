#!/bin/bash
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo "RUn the script with root access"
    else
    echo "running the script"
}

CHECK_ROOT