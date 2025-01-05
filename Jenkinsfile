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
        sh 'docker build -t chaoticpixel/cicd .'
      }
    }

    stage('Push') {
      steps {
        script {
          withDockerRegistry(credentialsId: 'docker-hub-credentials-id', url: 'https://index.docker.io/v1/') {
            docker.image('chaoticpixel/cicd').push("latest")
            docker.image('chaoticpixel/cicd').push(env.BUILD_NUMBER)
          }
        }

      }
    }

  }
}