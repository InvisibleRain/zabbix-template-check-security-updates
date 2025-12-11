# Zabbix template for monitoring unapplied security updates

The triggers will notify you whenever a host needs to install a security update or reboot the system/restart a daemon in order to apply them. The templates in this repo have been tested on Debian 13 and AlmaLinux 9.7. The instructions here assume that the zabbix agent is already up and running.

## Debian
1. Add [apt/crontab](apt/crontab) to your cron
2. Import the [apt/apt-security-updates.yml](apt/apt-security-updates.yml) template

## RHEL
Installation on RHEL-like systems such as Rocky or Alma is a little bit tricky due to [SELinux limitations](https://web.archive.org/web/20230608184205/https://at-hacker.in/?go=all/zabbix-agent-selinux-hardcore/). The basic idea here is to check for updates via simple bash scripts invoked from a systemd unit and store the output in a file that zabbix-agent can access.
1. Copy scripts from [dnf/scripts](dnf/scripts) to /opt/bin/zabbix-agent/
2. Run each script manually and verify that /var/run/zabbix/ has new files
3. Copy [dnf/zabbix-agent-script@.service](dnf/zabbix-agent-script@.service) and [dnf/zabbix-agent-script@.timer](dnf/zabbix-agent-script@.timer) to /etc/systemd/system/
4. Enable and start the following units:
```
zabbix-agent-script@dnf-check-update.service
zabbix-agent-script@needs-reboot.service
zabbix-agent-script@needs-restarting.service
zabbix-agent-script@dnf-check-update.timer
zabbix-agent-script@needs-reboot.timer
zabbix-agent-script@needs-restarting.timer
```
5. Import the [dnf/dnf-security-updates.yml](dnf/dnf-security-updates.yml) template
