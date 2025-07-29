pipeline {
  agent any

  environment {
    // Set correct path to npm and node (adjust if needed)
    PATH = "/opt/homebrew/bin:$PATH"
  }

  stages {
    stage('Install Dependencies') {
      steps {
        echo 'Installing Node.js dependencies...'
        sh 'npm install'
      }
    }

    stage('Build & Test') {
      steps {
        echo 'Running tests (dummy test)...'
        sh 'npm test'
      }
    }

    stage('Package Artifact') {
      steps {
        echo 'Packaging app into zip...'
        sh 'zip -r app.zip .'
      }
    }

    stage('Archive Artifact') {
      steps {
        echo 'Archiving artifact...'
        archiveArtifacts artifacts: 'app.zip', fingerprint: true
      }
    }

    stage('Run App') {
      steps {
        echo 'Starting the Node.js app...'
        sh 'node app.js &'
      }
    }
  }

  post {
    success {
      echo 'Pipeline completed successfully.'
    }
    failure {
      echo 'Pipeline failed.'
    }
  }
}

