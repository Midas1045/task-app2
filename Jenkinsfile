pipeline {
    agent any
    environment {
        DOCKER_USERNAME = "clint7"
        BACKEND_IMAGE  = "${DOCKER_USERNAME}/backend"
        FRONTEND_IMAGE = "${DOCKER_USERNAME}/projects-1-frontend"
        VERSION = "${BUILD_NUMBER}"
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Build Images') {
            steps {
                sh '''
                docker build -t $BACKEND_IMAGE:$VERSION ./backend
                docker build -t $FRONTEND_IMAGE:$VERSION ./frontend
                '''
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }
        stage('Push Images') {
            steps {
                sh '''
                docker push $BACKEND_IMAGE:$VERSION
                docker push $FRONTEND_IMAGE:$VERSION
                '''
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl set image deployment/backend-deployment backend=$BACKEND_IMAGE:$VERSION
                kubectl set image deployment/frontend-deployment frontend=$FRONTEND_IMAGE:$VERSION
                '''
            }
        }
    }
}
