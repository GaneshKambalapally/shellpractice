#!/bin/bash/

echo "enter the input file1"
read inputfile1
echo "enter the input file2"
read inputfile2
OUTPUT="/home/ec2-user/shellpractice/output.txt"

cat "$inputfile1""$inputfile2" >>"$OUTPUT"
# echo "$OUTPUT"

# echo "out put file is:" cat $outputfile