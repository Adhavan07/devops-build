pipeline {
  agent any

  environment {
    DEV_IMAGE = "nikkaman07/react-app-dev"
    PROD_IMAGE = "nikkaman07/react-app-prod"
  }

  stages {
    stage('Build & Push') {
      steps {
        script {
          if (env.BRANCH_NAME == 'dev') {
            sh "./build.sh ${DEV_IMAGE} ${BUILD_NUMBER}"
          } else if (env.BRANCH_NAME == 'master') {
            sh "./build.sh ${PROD_IMAGE} ${BUILD_NUMBER}"
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        script {
          if (env.BRANCH_NAME == 'dev') {
            sh "./deploy.sh ${DEV_IMAGE} ${BUILD_NUMBER}"
          } else if (env.BRANCH_NAME == 'master') {
            sh "./deploy.sh ${PROD_IMAGE} ${BUILD_NUMBER}"
          }
        }
      }
    }
  }
}
