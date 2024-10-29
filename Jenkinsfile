
// Updated the file

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AneesaZaki/MVCWebbApp.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
