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
                input message: 'Input requested', submitter: 'Approved by tomer or Abort'
            }
        }

        stage('Check Palindrome') {
            steps {
                sh 'chmod +x ./script.sh' // Ensure execute permission for script.sh
                script {
                    def scriptOutput = sh(returnStdout: true, script: './script.sh').trim()
                    env.RESULT = scriptOutput // Store result in environment variable
                }
            }
        }

        stage('Publish HTML Report') {
            steps {
                script {
                    def result = env.RESULT ?: 'No result available'  // Retrieve result from environment variable
                    def content = """
                    <html>
                    <head><title>Palindrome Check</title></head>
                    <body>
                    <h1>Palindrome Check Result</h1>
                    <p>Result: ${result}</p>
                    </body>
                    </html>
                    """
                    writeFile file: 'index.html', text: content
                }

                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '',
                    reportFiles: 'index.html',
                    reportName: 'Palindrome Check Report'
                ])
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
