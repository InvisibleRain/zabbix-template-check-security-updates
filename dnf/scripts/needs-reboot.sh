#!/bin/bash
result=$(/usr/bin/needs-restarting --reboothint >/dev/null; echo $?)
echo $result > /var/run/zabbix/needs-reboot
