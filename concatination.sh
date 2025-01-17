#!/bin/bash/

echo "enter the input file1"
read inputfile1
echo "enter the input file2"
read inputfile2

$inputfile1 && $inputfile2 | touch outputfile.txt 

# echo "out put file is:" cat $outputfile