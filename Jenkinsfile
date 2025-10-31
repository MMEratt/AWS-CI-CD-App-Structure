pipeline {
  agent any
  environment {
    AWS_REGION = "eu-central-1"
    APP_NAME   = "webapp-cicd"
    DG_NAME    = "webapp-dg"
    BUCKET     = "mmeratt-cicd-artifacts"
  }
  stages {
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }
    stage('Package Application') {
      steps {
        sh '''
          zip -r build-${BUILD_NUMBER}.zip app/ scripts/ appspec.yml
          echo "build-${BUILD_NUMBER}.zip" > artifact_name.txt
        '''
      }
    }
    stage('Upload to S3') {
      steps {
        sh '''
          ARTIFACT=$(cat artifact_name.txt)
          aws s3 cp "$ARTIFACT" "s3://$BUCKET/$JOB_NAME/$BUILD_NUMBER/$ARTIFACT" --region $AWS_REGION
        '''
      }
    }
    stage('Deploy with CodeDeploy') {
      steps {
        sh '''
          ARTIFACT=$(cat artifact_name.txt)
          aws deploy create-deployment \
            --application-name "$APP_NAME" \
            --deployment-group-name "$DG_NAME" \
            --s3-location bucket="$BUCKET",key="$JOB_NAME/$BUILD_NUMBER/$ARTIFACT",bundleType=zip \
            --region $AWS_REGION
        '''
      }
    }
  }
  post {
    success { echo "✅ Deployment triggered successfully!" }
    failure { echo "❌ Pipeline failed." }
  }
}
