#!/bin/bash/

SOURCE_DIR="/home/ec2-user/shellpractice/backup"

if [ -d $SOURCE_DIR ]
then
echo "Directory exist"
else
echo "Directory doesnt exist"
exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +7)

echo "Files are :$FILES"

while IFS= read -r line
do
    echo "deleting file $line"
    rm -rf $line
done <<< $FILES


