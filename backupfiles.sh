#!/bin/bash/

SOURCE_DIR="/home/ec2-user/"

if [ -d $SOURCE_DIR ]
then
echo "Directory exist"
else
echo "Directory doesnt exist"
exit 1
fi
