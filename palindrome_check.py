#!/usr/bin/env python3

import sys

def is_palindrome(s):
    cleaned_input = s.replace(" ", "").lower()  # Remove spaces and convert to lowercase
    return cleaned_input == cleaned_input[::-1]  # Check if string is equal to its reverse

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 palindrome_check.py <input_string>")
        sys.exit(1)

    input_string = sys.argv[1]  # Get input from command line argument
    if is_palindrome(input_string):
        print("Yes, it's a palindrome")
    else:
        print("No, it's not a palindrome")
