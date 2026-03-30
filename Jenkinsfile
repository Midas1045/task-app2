pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull code from GitHub
                git url: 'https://github.com/Midas1045/task-app2.git', branch: 'main'
            }
        }

        stage('Install Backend Dependencies') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Install Frontend Dependencies') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Verify Environment') {
            steps {
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('List Workspace') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }
    }
}