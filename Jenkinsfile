pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'chmod +x scripts/build.sh'
        sh 'script ./scripts/build.sh'
      }
    }

    stage('Test') {
      steps {
        sh 'script ./scripts/test.sh'
      }
    }

    stage('Docker build') {
      steps {
        sh 'docker build -t mybuildimage  '
      }
    }

  }
}