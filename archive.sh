#!/bin/bash/

SOURCE_DIR=/home/ec2-user/sourcedir
DESTINATION_DIR=/home/ec2-user/destinationdir

if [ -d $SOURCE_DIR ]
then echo "source is exist"
else
echo "source doesnot exist"
exit 1
fi
if [ -d $DESTINATION_DIR ]
then echo "destination is exist"
else
echo "destination doesnot exist"
exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +7)

echo "Files are :$FILES"
