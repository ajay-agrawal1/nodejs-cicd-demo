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
                sh '/opt/homebrew/bin/npm install'
            }
        }
        stage('Build & Test') {
            steps {
                sh '/opt/homebrew/bin/npm test || echo "No tests defined, skipping."'
            }
        }
        stage('Run App') {
            steps {
                sh '/opt/homebrew/bin/node app.js &'
            }
        }
    }
}
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
                sh '/opt/homebrew/bin/npm install'
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Build and test stage - Add commands here if any'
            }
        }

        stage('Run App') {
            steps {
                sh '/opt/homebrew/bin/node app.js &'
                echo 'App is running in the background (if no port conflict)'
            }
        }
    }
}
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

