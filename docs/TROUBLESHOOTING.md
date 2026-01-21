# Troubleshooting: Jenkins Email Notifications (`emailext`)

## System test email works but pipeline email does not
Cause: Mailer is configured, but Email Extension plugin (`emailext`) is not fully configured.

Fix:
- Configure Extended E-mail Notification (SMTP + Credentials + SSL/TLS).
- Set Jenkins Location → System Admin e-mail address.

## Console says "Sending email to..." but no email received
Check:
- Spam / Promotions
- Recipient address
- Gmail security blocks

## Authentication failures
Use Gmail App Password and correct SSL/TLS setting:
- smtp.gmail.com + 465 + SSL + App Password

## Network blocks SMTP (cloud)
Test from agent:
- nc -vz smtp.gmail.com 465
Allow outbound in SG/NACL if blocked.

## Enable logs
Log Recorder:
- hudson.plugins.emailext (ALL)
- com.sun.mail (ALL)
