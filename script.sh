
#!/bin/bash

input="sus"  # Replace with actual input or dynamic input from Jenkins

# Remove spaces if any
cleanedInput=$(echo "$input" | tr -d [:space:])

# Reverse the input
reversedInput=$(echo "$cleanedInput" | rev)

# Check if the original and reversed inputs are the same
if [ "$cleanedInput" = "$reversedInput" ]; then
    result="כן, זה פלינדרום"
else
    result="לא, זה לא פלינדרום"
fi

echo "$result"
