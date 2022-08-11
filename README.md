# Public IP monitoring

Self-hosting a server and maintaining a DNS record is tricky when your ISP changes your public IP on a regular basis. It is harder still when you're away from home and can't have an access to your router. This script monitors the public ip of the running system by polling an external service, and informs the user via mail if there's any change in the public IP.

## Installation
```bash
sudo apt install smstp dnsutils ca-certificates

echo "account <account_name>
tls on
tls_starttls off
auth on
host smtp.mail.yahoo.com
user user1
from user1@example.com
password <password>
tls_trust_file /etc/ssl/certs/ca-certificates.crt" > ~/.msmtprc

sudo cp public_ip_monitoring.service /etc/systemd/system
sudo cp public_ip_monitoring.timer /etc/systemd/system
sudo systemctl enable public_ip_monitoring.timer
```
