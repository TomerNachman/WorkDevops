#!/bin/bash

input="sus"  
cleanedInput=$(echo $input | tr -d '[:space:]')
reversedInput=$(echo $cleanedInput | rev)

if [ "$cleanedInput" == "$reversedInput" ]; then
    echo "Yes, it's a palindrome"
else
    echo "No, it's not a palindrome"
fi
