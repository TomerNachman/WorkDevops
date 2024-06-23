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
                // הרצת הסקריפט ב-Bash
                sh '''
                # הסרת רווחים מהמחרוזת המקורית והיפוך שלה
                cleanedInput=$(echo "$inputString" | tr -d '[:space:]')
                reversedInput=$(echo "$cleanedInput" | rev)

                # בדיקת פלינדרום
                if [[ "$cleanedInput" == "$reversedInput" ]]; then
                    result="כן, זה פלינדרום"
                else
                    result="לא, זה לא פלינדרום"
                fi

                # יצירת דוח HTML עם עיצוב CSS
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

                # כתיבת הדוח לקובץ
                echo "$htmlContent" > result.html
                '''
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
