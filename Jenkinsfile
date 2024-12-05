pipeline {
    agent any

    environment {
        TERRAFORM_WORKSPACE = 'default'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Hemanthkg-sigmoid/terraform-tas288.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
