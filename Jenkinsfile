pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'scripts/build.sh'
      }
    }

    stage('Test') {
      steps {
        sh 'scripts/test.sh'
      }
    }

    stage('Docker') {
      steps {
        sh 'docker build -t mybuildimage  '
      }
    }

  }
}