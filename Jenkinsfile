pipeline {
    agent any

    environment {
        NODE_PATH = "/opt/homebrew/bin"
        PATH = "${NODE_PATH}:/usr/local/bin:/usr/bin:/bin"
        EC2_HOST = "ubuntu@ec2-13-203-218-208"
        KEY_PATH = "/Users/ajayagrawal/Downloads/.ssh/ajay-key.pem"  // Adjust path if different
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/ajay-agrawal1/nodejs-cicd-demo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '/opt/homebrew/bin/npm install'
            }
        }

        stage('Build & Test') {
            steps {
                sh '/opt/homebrew/bin/npm test'
            }
        }

        stage('Package Artifact') {
            steps {
                sh 'tar -czf nodejs-cicd-demo.tar.gz *'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'nodejs-cicd-demo.tar.gz', followSymlinks: false
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '/usr/local/bin/docker build -t nodejs-cicd-demo .'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sh '''
                    scp -i $KEY_PATH nodejs-cicd-demo.tar.gz $EC2_HOST:/home/ubuntu/
                    ssh -i $KEY_PATH $EC2_HOST "tar -xzf nodejs-cicd-demo.tar.gz && nohup /opt/homebrew/bin/node app.js > app.log 2>&1 &"
                '''
            }
        }
    }
}

