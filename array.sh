#!/bin/bash
PERSONS=("ganesh" "radhika" "himansh" "ganvika")
echo "name of father is ${PERSONS[0]}"
echo "name of mother is ${PERSONS[1]}"
echo "name of son is ${PERSONS[2]}"
echo "name of daugther is ${PERSONS[3]}"

#to print all at a time
echo "names of family members is ${PERSONS[@]}"