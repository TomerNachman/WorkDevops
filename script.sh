#!/bin/bash

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"
    local reversed_input=$(echo "$input" | rev)
    if [[ "$input" == "$reversed_input" ]]; then
        echo "The string '$input' is a palindrome."
    else
        echo "The string '$input' is not a palindrome."
    fi
}

# Input string from the command line argument
input_string="$1"

# Validate input: must be a string, not purely numeric
if [[ -z "$input_string" ]]; then
    echo "Error: No input provided. Please enter a string." >&2
    exit 1
fi

if [[ "$input_string" =~ ^[0-9]+$ ]]; then
    echo "Error: Numeric input detected. Please enter a string." >&2
    exit 1
fi

# Check if the string is a palindrome
result=$(is_palindrome "$input_string")

# Output the result to the console
echo "$result"

# Generate HTML content
html_content="
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Palindrome Check Result</title>
</head>
<body>
    <h1>Palindrome Check Result</h1>
    <p>$result</p>
</body>
</html>
"

# Output the HTML content to a file
output_file="palindrome_result.html"
echo "$html_content" > "$output_file"
