pipeline {
    agent any

	tools{
		maven "MAVEN3"
		jdk "JDK"
	}

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AneesaZaki/MVCWebbApp.git'
            }
        }
        stage('Maven Build') {
            steps {
                bat "mvn clean compile"
            }
        }

    }
}


