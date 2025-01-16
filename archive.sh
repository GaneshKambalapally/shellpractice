#!/bin/bash/

SOURCE_DIR=/home/ec2-user/sourcedir
DESTINATION_DIR=/home/ec2-user/destinationdir
TIMESTAMP=$(date +"%m-%d-%Y-%H-%M-%S")
# File=$($0|cut -d "." -f1)

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

 find $SOURCE_DIR -name "*.log" -mtime +7 | zip "$DESTINATION_DIR/sample-$TIMESTAMP.zip" -@

 while IFS= read -r line
do
    echo "deleting file $line"
    rm -rf $line
done <<< $FILES