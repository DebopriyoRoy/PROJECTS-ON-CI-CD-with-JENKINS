pipeline {
  agent any

  environment {
    cred = credentials('aws-cred') //Differs for every user// *** It will be availbe in Manage Jenkins ---> Under credentials tab
    AWS_REGION = "us-east-2"
  }

  stages {

    stage('describe instances') {
      steps {
        sh "aws ec2 describe-instances --region ${AWS_REGION}"
      }
    }

    stage('creating snapshot') {
      steps {
        script {
          // Change this to the instance Name tag you want to snapshot
          def targetName = "CI-CD Jenkins"

          def id = sh(
            script: "aws ec2 describe-instances --region ${AWS_REGION} " +
                    "--filters \"Name=tag:Name,Values=${targetName}\" \"Name=instance-state-name,Values=running\" " +
                    "--query \"Reservations[].Instances[].InstanceId\" --output text",
            returnStdout: true
          ).trim()

          if (!id) {
            error("No running instance found with tag Name='${targetName}' in region ${AWS_REGION}")
          }
          echo "InstanceId = ${id}"

          def volumeId = sh(
            script: "aws ec2 describe-instances --region ${AWS_REGION} --instance-ids ${id} " +
                    "--query \"Reservations[].Instances[].BlockDeviceMappings[0].Ebs.VolumeId\" --output text",
            returnStdout: true
          ).trim()

          if (!volumeId) {
            error("No volume found attached to instance ${id}")
          }
          echo "VolumeId = ${volumeId}"

          def snapshotId = sh(
            script: "aws ec2 create-snapshot --region ${AWS_REGION} --volume-id ${volumeId} " +
                    "--description \"Snapshot created from Jenkins build ${BUILD_NUMBER}\" " +
                    "--query \"SnapshotId\" --output text",
            returnStdout: true
          ).trim()

          echo "SnapshotId = ${snapshotId}"
        }
      }
    }
  }
}
