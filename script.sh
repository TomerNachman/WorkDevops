#!/bin/bash

# Clone the Git repository
git clone https://github.com/TomerNachman/WorkDevops.git
cd WorkDevops

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


# Create HTML report with CSS styling
htmlContent=$(cat <<EOF
<html>
<head>
    <title>תוצאת בדיקת פלינדרום</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            background: white;
            padding: 2em;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>$result</h1>
    </div>
</body>
</html>
EOF
)

# Write the HTML content to a file
echo "$htmlContent" > result.html

# Display the HTML file using the default web browser
xdg-open result.html
