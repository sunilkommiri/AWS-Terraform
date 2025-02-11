pipeline {
    agent any // Run on any available Jenkins agent

    environment {
        withCredentials([(credentialsId:'github_key1')]) {
            BUCKET_NAME = 'jenkiss3'
        }
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
