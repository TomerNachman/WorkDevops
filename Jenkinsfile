pipeline {
    agent any

    parameters {
        string(name: 'user_input', defaultValue: 'madam', description: 'Enter a string to check if it is a palindrome')
    }

    environment {
        OUTPUT_FILE = 'palindrome_result.html'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/osll1/Linux.git'  
            }
        }

        stage('Run Shell Script') {
            steps {
                script {
                    def output = sh(script: """
                        #!/bin/bash

                        input_string="${params.user_input}"

                        # Validate input: must be a string, not purely numeric
                        if [[ -z "$input_string" ]]; then
                            echo "Error: No input provided. Please enter a string." >&2
                            exit 1
                        fi

                        if [[ "$input_string" =~ ^[0-9]+$ ]]; then
                            echo "Error: Numeric input detected. Please enter a string." >&2
                            exit 1
                        fi

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

                        # Check if the string is a palindrome
                        is_palindrome "$input_string"
                    """, returnStdout: true).trim()
                    
                    def errorMessage = ""
                    if (output.contains("Error:")) {
                        errorMessage = output
                        output = "Invalid input. Please enter a non-numeric string."
                    }

                    echo output // This line outputs the result to the Jenkins console

                    // Write the HTML file content
                    def htmlContent = """
                        <!DOCTYPE html>
                        <html lang='en'>
                        <head>
                            <meta charset='UTF-8'>
                            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                            <title>Palindrome Check Result</title>
                        </head>
                        <body>
                            <h1>Palindrome Check Result</h1>
                            <p>${output}</p>
                        </body>
                        </html>
                    """
                    if (errorMessage) {
                        htmlContent = """
                            <!DOCTYPE html>
                            <html lang='en'>
                            <head>
                                <meta charset='UTF-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                                <title>Palindrome Check Error</title>
                            </head>
                            <body>
                                <h1>Error</h1>
                                <p>${errorMessage}</p>
                            </body>
                            </html>
                        """
                    }

                    writeFile file: OUTPUT_FILE, text: htmlContent
                }
            }
        }

        stage('Display Parameter') {
            steps {
                script {
                    currentBuild.description = "String parameter is '${params.user_input}'"
                }
            }
        }

        stage('Verify Parameter on Web Page') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.user_input}")) {
                        echo "Parameter '${params.user_input}' exists on the web page."
                    } else {
                        error "Parameter '${params.user_input}' does not exist on the web page."
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: OUTPUT_FILE, fingerprint: true
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: OUTPUT_FILE,
                reportName: 'Palindrome Check Result'
            ])
        }
    }
}

