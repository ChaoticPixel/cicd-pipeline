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
        script {
          docker.build('duman_image_1')
        }

      }
    }

    stage('Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_creds_id')
        }

      }
    }

  }
}