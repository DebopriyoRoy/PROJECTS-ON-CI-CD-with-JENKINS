pipeline {
    agent { label 'worker' }

    stages {
        stage('test email') {
            steps {
                echo "hello"
            }
        }
    }

    post {
        always {
            emailext(
                to: 'devoptesting@sharklasers.com',
                subject: "job status",
                body: "job is done!!!"
            )
        }
    }
}
