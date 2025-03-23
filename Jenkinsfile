pipeline {
    agent any
    stages{
        stage('Clone Repository') {
            steps {
                git 'https://github.com/prajwalS0209/devops-assignment.git'
            }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ucube:latest .'
            }
        }
        stage('Push Docker image') {
            steps {
                sh 'docker push ucube:latest'
            }
        }
      }   
    }
}