# Jenkins → Maven → Docker → AWS ECR (Pipeline Showcase)

This repo is a **ready-to-commit** showcase of a Jenkins Pipeline that:
1. Checks out code
2. Builds with Maven
3. Builds a Docker image
4. Logs into AWS ECR
5. Pushes the image to ECR using the Jenkins `BUILD_NUMBER` as the tag

## What’s included
- `Jenkinsfile` (Declarative Pipeline)
- `Dockerfile` (demo image; replace with your app Dockerfile if needed)
- `docs/screenshots/` (your Jenkins + AWS ECR screenshots)

## Prerequisites (Jenkins node/agent)
- Docker installed and running
- AWS CLI installed (`aws --version`)
- Maven configured in Jenkins:
  - **Manage Jenkins → Global Tool Configuration → Maven**
  - Name must be exactly: `Maven`
- AWS credentials in Jenkins:
  - Install **AWS Credentials Plugin**
  - **Manage Jenkins → Credentials → (global) → Add Credentials**
  - Kind: `AWS Credentials`
  - ID: `aws-cred`

## AWS / ECR values used (edit if yours differ)
- Region: `us-east-2`
- Registry: `357533627195.dkr.ecr.us-east-2.amazonaws.com`
- Repo: `privaterepo`

## How to use (GitHub)
```bash
git init
git add .
git commit -m "Add Jenkins pipeline for Maven build + Docker build + AWS ECR push"
```

Then create a GitHub repo and push:
```bash
git branch -M main
git remote add origin https://github.com/<your-username>/jenkins-aws-ecr-pipeline-showcase.git
git push -u origin main
```

## Screenshots
All screenshots are saved here:
- `docs/screenshots/01.png` ... `docs/screenshots/07.png`

> Tip: Add these to your GitHub README in your repo for a strong portfolio showcase.
