pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ucube:latest"
        DOCKER_REGISTRY = "prajwals0209"
        K8S_MASTER = 'uCube@35.200.206.13'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/prajwalS0209/devops-assignment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $DOCKER_REGISTRY/$DOCKER_IMAGE'
            }
        }
        stage('Deploy pod') {
            steps {
                sshagent(['uCube-server']) { 
                    sh """
                    ssh -o StrictHostKeyChecking=no $K8S_MASTER \\
                        "sudo kubectl rollout restart deploy ucube-app"
                    """
                }

        }
    }
}
