#!/bin/bash

# Remove spaces from the input string and reverse it
cleanedInput=$(echo "$1" | tr -d '[:space:]')
reversedInput=$(echo "$cleanedInput" | rev)

# Check if the input string is a palindrome
if [ "$cleanedInput" = "$reversedInput" ]; then
    result="כן, זה פלינדרום"
else
    result="לא, זה לא פלינדרום"
fi

# Print the result
echo "$result"

