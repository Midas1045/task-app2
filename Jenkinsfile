pipeline {
    agent any

    stages {
        stage('Debug') {
            steps {
                sh 'echo STARTED'
                sh 'whoami'
                sh 'node -v || echo NO NODE'
                sh 'npm -v || echo NO NPM'
                sh 'docker -v || echo NO DOCKER'
                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Verify Environment') {
            steps {
                dir('backend') {
                    sh 'node -v'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t task-app2 .'
            }
        }
    }
}
