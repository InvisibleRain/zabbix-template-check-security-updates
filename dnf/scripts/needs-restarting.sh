#!/bin/bash
result=$(/usr/bin/needs-restarting --services 2>/dev/null | /usr/bin/grep -v PID | /usr/bin/wc -l)
echo $result > /var/run/zabbix/needs-restarting
