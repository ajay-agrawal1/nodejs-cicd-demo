pipeline {
    agent any

    environment {
        APP_NAME = "nodejs-cicd-demo"
        DOCKER_IMAGE = "nodejs-cicd-demo:latest"
        EC2_HOST = "13.203.218.208"  // Replace with your EC2 IP
        EC2_USER = "ubuntu"
        SSH_KEY_ID = "ec2-ssh-key"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/ajay-agrawal1/nodejs-cicd-demo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Package Artifact') {
            steps {
                sh 'tar -czf ${APP_NAME}.tar.gz *'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: '*.tar.gz', followSymlinks: false
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent (credentials: [SSH_KEY_ID]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} 'docker stop ${APP_NAME} || true && docker rm ${APP_NAME} || true'
                        scp -o StrictHostKeyChecking=no ${APP_NAME}.tar.gz ${EC2_USER}@${EC2_HOST}:/home/ubuntu/
                        ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} '
                            docker load < /home/ubuntu/${APP_NAME}.tar.gz || true
                            docker run -d --name ${APP_NAME} -p 4000:4000 ${DOCKER_IMAGE}
                        '
                    """
                }
            }
        }
    }
}

