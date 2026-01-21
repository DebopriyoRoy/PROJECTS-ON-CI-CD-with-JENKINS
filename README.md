# Jenkins → AWS EC2 Snapshot (Pipeline Run Evidence)

This repo is a **commit-ready** showcase for a Jenkins Pipeline that:
- Lists EC2 instances
- Finds a running instance by **Name tag**
- Fetches the root EBS `VolumeId`
- Creates an EBS snapshot (description includes Jenkins `BUILD_NUMBER`)

## Files
- `Jenkinsfile` — pipeline code (AWS CLI based)
- `docs/screenshots/01-jenkins-pipeline-run-snapshot-success.png` — Jenkins run screenshot (success)
- `docs/outputs/01-jenkins-console-output-build-2.txt` — Jenkins console output captured as text

## Prerequisites
- Jenkins agent has:
  - AWS CLI installed (`aws --version`)
  - IAM permissions: `ec2:DescribeInstances`, `ec2:CreateSnapshot`
  - Authentication configured for AWS CLI (IAM role on EC2 is recommended)

## How to commit & push
```bash
git init
git add .
git commit -m "Add Jenkins pipeline for EC2 EBS snapshot creation + run evidence"
```

Then push to GitHub:
```bash
git branch -M main
git remote add origin https://github.com/<your-username>/jenkins-aws-ec2-snapshot-pipeline-run.git
git push -u origin main
```
