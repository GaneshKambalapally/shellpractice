#!/bin/bash/

SOURCE_DIR=/home/ec2-user/sourcedir
if [ -d $SOURCE_DIR ]
then echo "source is exist"
else
echo "source doesnot exist"
exit 1
fi
