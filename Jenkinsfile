pipeline {
    agent any
    parameters {
        string(name: 'inputString', defaultValue: '', description: 'String to check if it is a palindrome')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/TomerNachman/WorkDevops.git'
            }
        }
        stage('Run Palindrome Check') {
            steps {
                script {
                    // Write the input string to a file (if needed)
                    writeFile file: 'input.txt', text: params.inputString
                }
                // Run the Bash script with the input string
                sh 'chmod +x script.sh'
                sh "./script.sh \"${params.inputString}\""
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
