#!/bin/bash

input="sus"  # Replace with your actual input or parameterized input
cleanedInput=$(echo $input | tr -d '[:space:]')
reversedInput=$(echo $cleanedInput | rev)

if [ "$cleanedInput" == "$reversedInput" ]; then
    echo "Yes, it's a palindrome"
else
    echo "No, it's not a palindrome"
fi
