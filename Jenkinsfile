pipeline {
    agent any
    stages {
        stage('Get Input') {
            steps {
                script {
                    inputString = input message: 'Enter a string to check if it is a palindrome:', parameters: [string(defaultValue: '', description: 'String to check', name: 'inputString')]
                }
            }
        }
        stage('Checkout') {
            steps {
                git 'https://github.com/TomerNachman/WorkDevops.git'
            }
        }
        stage('Run Palindrome Check') {
            steps {
                script {
                    // Write the input string to a file
                    writeFile file: 'input.txt', text: inputString
                }
                // Run the Bash script with the input string
                sh 'chmod +x script.sh'
                sh './script.sh "${inputString}"'
            }
        }
        stage('Publish HTML Report') {
            steps {
                publishHTML target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '.',
                    reportFiles: 'palindrome_result.html',
                    reportName: 'Palindrome Check Report'
                ]
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
