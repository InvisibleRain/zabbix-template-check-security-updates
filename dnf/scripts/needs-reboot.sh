#!/bin/bash
/usr/bin/needs-restarting --reboothint >/dev/null; echo $? > /var/run/zabbix/needs-reboot
