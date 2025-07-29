pipeline {
    agent any

    environment {
	DOCKER_CONFIG = "${env.HOME}/.jenkins-docker-config"
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
                sh '/usr/local/bin/docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Previous Container') {
            steps {
                sh '/usr/local/bin/docker rm -f $CONTAINER_NAME || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '/usr/local/bin/docker run -d --name $CONTAINER_NAME -p $PORT:4000 $IMAGE_NAME'
            }
        }
    }
}

