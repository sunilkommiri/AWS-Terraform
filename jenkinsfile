pipeline {
    agent any // Run on any available Jenkins agent

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') // Store your AWS access key ID as a Jenkins credential
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Store your AWS secret access key as a Jenkins credential
        BUCKET_NAME = 'jenkiss3' // Replace with your S3 bucket name
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sunilkommiri/AWS-Terraform/' // Replace with your Git repository URL and branch
            }
        }

        stage('Deploy to S3') {
            steps {
                script {
                    // Use the AWS CLI to upload files to S3
                    sh '''
                        aws s3 cp . s3://$BUCKET_NAME --recursive --exclude "*.git*" --exclude ".git/*" --exclude ".github/*" --exclude ".gitignore"
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
        success {
            echo "Deployment to S3 successful!"
        }
        failure {
            echo "Deployment to S3 failed!"
        }
    }
}
