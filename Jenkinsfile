#!groovy

node('armv7') {
  stage('Checkout') {
    checkout scm
  }

  stage('Build') {
    sh 'sudo docker build -t armhero/home-assistant:\044{BRANCH_NAME} .'
  }

  stage('Push') {
    withCredentials([
      usernamePassword(credentialsId: '1d448f61-46d6-4af8-a517-9a06866447bb',
      passwordVariable: 'DOCKER_PASSWORD',
      usernameVariable: 'DOCKER_USERNAME')
    ]) {
      sh '''#!/bin/bash -xe
        sudo docker login -u \044{DOCKER_USERNAME} -p \044{DOCKER_PASSWORD}

        if [[ "\044{BRANCH_NAME}" == "master" ]]; then
          # when we are in the master branch, then set a new tag
          sudo docker tag armhero/home-assistant:\044{BRANCH_NAME} armhero/home-assistant:latest

          sudo docker push armhero/home-assistant:latest
        else
          sudo docker push armhero/home-assistant:${BRANCH_NAME}
        fi

        curl -X POST https://hooks.microbadger.com/images/armhero/home-assistant/MYOTgmjXvS3cD7tIOzw8O2GdGRw=
      '''
    }
  }

  stage('Deploy') {
    build 'docker.deployment.epsilon'
  }
}
