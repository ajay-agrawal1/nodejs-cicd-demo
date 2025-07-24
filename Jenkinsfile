pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/ajay-agrawal1/nodejs-cicd-demo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'npm test || echo "No tests available"'
            }
        }

        stage('Run App') {
            steps {
                sh 'node app.js &'
            }
        }
    }
}

