pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/TomerNachman/WorkDevops.git'
            }
        }

        stage('Palindrome Check') {
            steps {
                script {
                    def inputString = 'madam' // Replace with your input or use parameter
                    def result = sh(script: "python3 palindrome_check.py ${inputString}", returnStdout: true).trim()
                    echo "Palindrome Check Result: ${result}"
                    env.PALINDROME_RESULT = result
                }
            }
        }

        stage('Display Result') {
            steps {
                script {
                    def result = env.PALINDROME_RESULT ?: 'No result available'
                    writeFile file: 'result.txt', text: result
                    archiveArtifacts artifacts: 'result.txt', allowEmptyArchive: true
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

    }
}

}
