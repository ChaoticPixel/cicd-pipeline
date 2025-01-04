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
        sh 'docker build -t mybuildimage .'
      }
    }

    stage('Push') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_creds_id')  {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
        }

      }
    }

  }
}