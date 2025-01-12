#!/bin/bash

echo "names $@"
echo "$#"
echo "process instance id $$"
echo "script name is $0"
sleep 100 &
echo "previous process instance id $!"
