#!/bin/bash/

echo "enter the input file1"
read inputfile1
echo "enter the input file2"
read inputfile2
echo "enter the output file"
read outputfile

$(inputfile1 && inputfile2) | $outputfile -@

# echo "out put file is:" cat $outputfile