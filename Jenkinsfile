pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'script script scripts/build.sh'
      }
    }

    stage('Test') {
      steps {
        sh 'script scripts/test.sh'
      }
    }

    stage('Docker') {
      steps {
        sh 'docker build -t mybuildimage  '
      }
    }

  }
}