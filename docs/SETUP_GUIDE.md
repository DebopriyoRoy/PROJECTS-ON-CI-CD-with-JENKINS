# Setup Guide: Jenkins Email Notification Automation

This guide walks you through setting up Gmail SMTP email notifications in Jenkins using the Email Extension plugin (`emailext`).

## 1) Generate a Gmail App Password
1. Enable **2‑Step Verification** on your Gmail account.
2. Create an **App Password** (Mail / Other).
3. Copy the 16‑character App Password (store it securely).

## 2) Install Required Jenkins Plugins
Go to: **Manage Jenkins → Plugins**
Install:
- Email Extension Plugin
- Mailer Plugin
Restart Jenkins if prompted.

## 3) Add Gmail Credentials in Jenkins
Go to: **Manage Jenkins → Credentials → System → Global credentials → Add Credentials**
- Kind: Username with password
- Username: your Gmail address
- Password: Gmail App Password
- ID: gmail-smtp (example)

## 4) Configure Jenkins Location
Manage Jenkins → Configure System → Jenkins Location
- Jenkins URL: http://<public-ip>:8080/
- System Admin e-mail address: your Gmail address

## 5) Configure Extended E-mail Notification (for `emailext`)
Manage Jenkins → Configure System → Extended E-mail Notification
- SMTP server: smtp.gmail.com
- SMTP Port: 465
- Credentials: select gmail-smtp
- Use SSL: enabled

## 6) Configure E-mail Notification (Mailer)
Manage Jenkins → Configure System → E-mail Notification
- SMTP server: smtp.gmail.com
- Default user e-mail suffix: @gmail.com

## Notes
- Port 465 = SSL
- Port 587 = TLS
