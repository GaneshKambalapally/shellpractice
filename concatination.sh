#!/bin/bash/

echo "enter the input file1"
read inputfile1
echo "enter the input file2"
read inputfile2
OUTPUT="/home/ec2-user/shellpractice/output.txt"

$inputfile1$inputfile2 &>>outputfile.txt 

# echo "out put file is:" cat $outputfile