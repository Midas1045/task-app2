pipeline {
    agent any

    stages {
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
    }
}