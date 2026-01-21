pipeline{
    agent any
    tools{
        maven 'Maven'
    }
    environment{
        cred = credentials('aws-cred')
    }
    stages{
        stage('Checkout stage'){
            steps{
                checkout scmGit(branches: [[name: '*/aws-ecr-setup']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/DebopriyoRoy/PROJECTS-ON-CI-CD-with-JENKINS.git']])
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn package'
            }
        }
        stage('Docker Build'){
            steps{
                sh 'docker build -t 357533627195.dkr.ecr.us-east-2.amazonaws.com/privaterepo:${BUILD_NUMBER}'
            }
        }
        stage('ECR push'){
            steps{
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 357533627195.dkr.ecr.us-east-2.amazonaws.com'
                sh 'docker push 357533627195.dkr.ecr.us-east-2.amazonaws.com/privaterepo:${BUILD_NUMBER}'
            }
        }
    }
}
