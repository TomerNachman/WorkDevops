pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // שלב לשכפול קוד המקור מ-Git
                git url: 'https://github.com/TomerNachman/WorkDevops.git', branch: 'master'
            }
        }

        stage('Get Input') {
            steps {
                script {
                    // בקש מהמשתמש להזין מחרוזת לבדיקה
                    env.inputString = input message: 'הזן מחרוזת לבדיקה:', parameters: [string(defaultValue: '', description: 'מחרוזת', name: 'inputString')]
                }
            }
        }

        stage('Check Palindrome') {
            steps {
                script {
                    // הסרת רווחים מהמחרוזת המקורית והיפוך שלה
                    def cleanedInput = env.inputString.replaceAll("\\s", "")
                    def reversedInput = cleanedInput.reverse()

                    // בדיקת פלינדרום
                    def result
                    if (cleanedInput == reversedInput) {
                        result = "כן, זה פלינדרום"
                    } else {
                        result = "לא, זה לא פלינדרום"
                    }

                    // יצירת דוח HTML
                    writeFile file: 'result.html', text: """
                        <html>
                        <head>
                            <title>תוצאת בדיקת פלינדרום</title>
                        </head>
                        <body>
                            <h1>${result}</h1>
                        </body>
                        </html>
                    """
                }
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '.',
                    reportFiles: 'result.html',
                    reportName: 'תוצאת בדיקת פלינדרום'
                ])
            }
        }
    }

    post {
        always {
            // ניקוי לאחר הרצה
            cleanWs()
        }
    }
}

