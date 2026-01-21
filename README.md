# Jenkins Email Notification Automation (Gmail SMTP + `emailext`)

This project showcases how to configure **Jenkins Email Notifications** using **Gmail SMTP** and the **Email Extension Plugin** (`emailext`) to automatically send an email after a pipeline completes.

---

## What this project does
- Runs a Jenkins Declarative Pipeline on an agent labeled `worker`
- Executes a sample stage (`echo "hello"`)
- Sends an email notification in `post { always { ... } }` using `emailext`
- Verifies delivery via Gmail inbox

---

## Tech Stack
- Jenkins (Pipeline / Declarative)
- Email Extension Plugin (`emailext`)
- Mailer Plugin
- Gmail SMTP (`smtp.gmail.com`)
- Jenkins Credentials Manager (Gmail App Password)

---

## Prerequisites
1. Jenkins installed and running
2. Plugins installed:
   - **Email Extension Plugin**
   - **Mailer Plugin**
3. Gmail account with:
   - **2‑Step Verification enabled**
   - **App Password generated**

---

## Configuration (Step-by-step)

### 1) Create Gmail App Password Credentials in Jenkins
Path: **Manage Jenkins → Credentials → System → Global credentials → Add Credentials**

- Kind: `Username with password`
- Username: `<gmail-user@gmail.com>`
- Password: `Gmail App Password`
- ID: a unique value (example: `gmail-smtp`)
- Description: `Gmail SMTP App Password`

Screenshot: `screenshots/1-jenkins-credentials-gmail-app-password.png`

---

### 2) Configure Jenkins Location (System Admin Email)
Path: **Manage Jenkins → Configure System → Jenkins Location**

- Jenkins URL: `http://<public-ip>:8080/` (or your domain)
- System Admin e-mail address: `<gmail-user@gmail.com>`

Screenshot: `screenshots/2-jenkins-location-admin-email.png`

---

### 3) Configure Extended E-mail Notification (Email Extension Plugin)
Path: **Manage Jenkins → Configure System → Extended E-mail Notification**

- SMTP server: `smtp.gmail.com`
- SMTP Port: `465`
- Credentials: select your Gmail App Password credential
- ✅ Use SSL

Screenshot: `screenshots/3-extended-email-notification-config.png`

---

### 4) Configure E-mail Notification (Mailer Plugin)
Path: **Manage Jenkins → Configure System → E-mail Notification**

- SMTP server: `smtp.gmail.com`
- Default user e-mail suffix: `@gmail.com`

Screenshot: `screenshots/4-mailer-email-notification-config.png`

---

## Pipeline

### Jenkinsfile
See [`Jenkinsfile`](./Jenkinsfile). It uses:
- `agent { label 'worker' }`
- Stage: `test email`
- Post actions: `emailext(...)`

---

## Proof of Execution
- Console Output: `screenshots/8-console-output-success.png`
- Pipeline Overview: `screenshots/9-pipeline-overview-success.png`
- Gmail Received: `screenshots/10-gmail-received-email.png`

---

## Security Notes
- **Never** commit Gmail App Passwords to GitHub.
- Store secrets in **Jenkins Credentials Manager** only.
