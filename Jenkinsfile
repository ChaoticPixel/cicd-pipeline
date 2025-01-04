pipeline {
  agent any
  stages {
    stage('Build') {
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

    stage('Docker') {
      steps {
        sh '''docker build -t ChaoticPixel/mybuildimage
'''
      }
    }

    stage('Push') {
      environment {
        IMAGE_NAME = 'chaoticpixel/mybuildimage '
        DOCKER_CREDENTIALS = 'docker-hub-credentials-id'
      }
      steps {
        sh '''docker.withRegistry(\'https://registry.hub.docker.com\', \'docker_hub_creds_id\')
          {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }'''
      }
    }

  }
  environment {
    DOCKER_CREDENTIALS = 'docker-hub-credentials-id	'
    IMAGE_NAME = 'chaoticpixel/'
  }
}