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
                sh 'chmod +x ./script.sh' // Grant execute permission to script.sh
                sh './script.sh'
            }
        }

        stage('Publish HTML Report') {
            steps {
                script {
                    // Write content for HTML report
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
