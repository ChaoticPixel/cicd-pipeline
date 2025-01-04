pipeline {
  agent any
  stages {
    stage('Build ') {
      steps {
        sh '''chmod +x \'scripts/build.sh\'
script ./scripts/build.sh'''
      }
    }

    stage('Test') {
      steps {
        sh 'script ./scripts/test.sh'
      }
    }

    stage('Docker') {
      steps {
        sh 'docker build -t chaoticpixel/mybuildimage .'
      }
    }

    stage('Push') {
      steps {
        script {
          withDockerRegistry(credentialsId: 'docker-hub-credentials-id', url: 'https://registry.hub.docker.com') {
            docker.image('chaoticpixel/cicd/mybuildimage').push("latest")
          }
        }

      }
    }

  }
}