# System Health Monitor Script

## Description
This bash script monitors system health by providing options to check disk usage, active services, memory status, CPU load, and email a full system report.

## Usage
```bash
To change the Permissions ...
chmod +x system_health_monitor.sh

To run the Script ...
./system_health_monitor.sh
```

Required Packages

mailutils (or bsd-mailx) — for sending email
systemd (for systemctl)

```bash
sudo apt-get update
sudo apt-get install mailutils

```

Ensure your system is configured to send emails via the mail command.