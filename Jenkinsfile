pipeline {
    agent any

    tools {
        maven "MAVEN3"
        jdk "JDK"
    }

    environment {
        // Set environment variables for Docker login
        DOCKER_HUB_USERNAME = 'aneesazaki'  // Your Docker Hub username
        DOCKER_HUB_PASSWORD = credentials('DOCKER_HUB_PASSWORD')  // Jenkins secret credentials for Docker Hub access token
        DOCKER_IMAGE_NAME = 'aneesazaki/myapp'  // Your Docker image name
    }

    stages {
        // Stage 1: Checkout
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AneesaZaki/MVCWebbApp.git'
            }
        }

        // Stage 2: Maven Build
        stage('Maven Build') {
            steps {
                bat "mvn clean compile"
            }
        }

        // Stage 3: Docker Login
        stage('Docker Login') {
            steps {
                script {
                    // Docker login using Jenkins credentials
                    bat """
                    echo ${DOCKER_HUB_PASSWORD} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin
                    """
                }
            }
        }

        // Stage 4: Docker Build
        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image
                    bat "docker build -t ${DOCKER_IMAGE_NAME}:${env.BUILD_ID} ."
                }
            }
        }

        // Stage 5: Docker Push
        stage('Docker Push') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    bat "docker push ${DOCKER_IMAGE_NAME}:${env.BUILD_ID}"
                }
            }
        }
    }
}





// pipeline {
//     agent any

// 	tools{
// 		maven "MAVEN3"
// 		jdk "JDK"
// 	}

//     stages {
//         stage('Checkout') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/AneesaZaki/MVCWebbApp.git'
//             }
//         }
//         stage('Maven Build') {
//             steps {
//                 bat "mvn clean compile"
//             }
//         }

//     }
// }


