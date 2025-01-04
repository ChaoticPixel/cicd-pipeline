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
          script {
                    // Сборка Docker-образа
            docker.build("${IMAGE_NAME}:latest")
          }
    }

    stage('Push') {
      steps {
          docker.withRegistry(\'https://registry.hub.docker.com\', \'docker_hub_creds_id\'){
            docker.image("${IMAGE_NAME}:latest").push()
          }
      }
    }

  }
  environment {
    DOCKER_CREDENTIALS = 'docker-hub-credentials-id	'
    IMAGE_NAME = 'chaoticpixel/mybuildimage'
  }
}
