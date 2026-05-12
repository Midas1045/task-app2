pipeline {
    agent any

    environment {
        DOCKER_USERNAME = "clint7"
        BACKEND_IMAGE  = "${DOCKER_USERNAME}/backend"
        FRONTEND_IMAGE = "${DOCKER_USERNAME}/projects-1-frontend"
        VERSION = "${BUILD_NUMBER}"
        PROMETHEUS_URL = "http://prometheus-server.monitoring:9090"
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

        // 1️⃣ HEALTH CHECK (FAIL FAST IF BROKEN)
        stage('Health Check') {
            steps {
                script {
                    sh '''
                    kubectl rollout status deployment/backend-deployment --timeout=60s
                    kubectl rollout status deployment/frontend-deployment --timeout=60s
                    '''

                    def pods = sh(script: "kubectl get pods | grep CrashLoopBackOff || true", returnStdout: true).trim()

                    if (pods) {
                        error("❌ CrashLoop detected in pods. Failing pipeline.")
                    }
                }
            }
        }

        // 2️⃣ PROMETHEUS METRICS CHECK
        stage('Prometheus Metrics Validation') {
            steps {
                script {
                    def cpuQuery = "rate(container_cpu_usage_seconds_total[1m])"
                    
                    def response = sh(
                        script: """
                        curl -s "$PROMETHEUS_URL/api/v1/query?query=${cpuQuery}"
                        """,
                        returnStdout: true
                    ).trim()

                    echo "Prometheus Response: ${response}"

                    if (!response.contains("result")) {
                        error("❌ Prometheus query failed or returned no data")
                    }
                }
            }
        }

        // 3️⃣ AUTO ROLLBACK ON FAILURE
        stage('Rollback if Needed') {
            when {
                expression { currentBuild.currentResult == 'FAILURE' }
            }
            steps {
                sh '''
                echo "⚠️ Rolling back deployment..."

                kubectl rollout undo deployment/backend-deployment
                kubectl rollout undo deployment/frontend-deployment

                kubectl rollout status deployment/backend-deployment
                kubectl rollout status deployment/frontend-deployment
                '''
            }
        }
    }

    post {
        failure {
            echo "❌ Pipeline failed — rollback may have been triggered"
        }
        success {
            echo "✅ Deployment successful and verified"
        }
    }
}