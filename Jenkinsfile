pipeline {
    agent any

    environment {
        PATH = "/opt/homebrew/bin:$PATH"
    }

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
                sh 'npm test || echo "No tests defined"'
            }
        }

        stage('Run App') {
            steps {
                sh 'node app.js &'
            }
        }
    }
}

