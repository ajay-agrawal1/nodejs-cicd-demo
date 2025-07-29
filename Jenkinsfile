pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nodejs-cicd-demo'
        CONTAINER_NAME = 'nodejs-app'
        PORT = '4000'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Previous Container') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p $PORT:4000 $IMAGE_NAME'
            }
        }
    }
}

