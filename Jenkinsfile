pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Clone Repository') {
            steps {
                git 'https://github.com/TomerNachman/WorkDevops.git'
            }
        }

        stage('Get Input') {
            steps {
                input message: 'Input requested', ok: 'Approved by tomer'
            }
        }

        stage('Check Palindrome') {
            steps {
                sh './script.sh'
            }
        }

        stage('Publish HTML Report') {
            steps {
                // Implement HTML report publishing steps here
                echo 'Publishing HTML Report'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

