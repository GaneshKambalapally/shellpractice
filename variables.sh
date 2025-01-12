#!/bin/bash
#examples of variable
#PERSON1=ganesh
#PERSON2=radhika

#echo "$PERSON1::Hi $PERSON2, how are you?"
#echo "$PERSON2::Hello $PERSON1, i am good ,thank you."

#same example can be executed by passing the values in runtime

PERSON1=$1
PERSON2=$2

echo "$PERSON1::Hi $PERSON2, how are you?"
echo "$PERSON2::Hello $PERSON1, i am good ,thank you."
