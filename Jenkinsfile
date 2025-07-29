pipeline {
    agent any

    stages {
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
                sh '''
                    tar --exclude='./node_modules' -czf nodejs-app.tar.gz .
                '''
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'nodejs-app.tar.gz', fingerprint: true
            }
        }

        stage('Run App') {
            steps {
                sh 'nohup node app.js &'
            }
        }
    }
}

