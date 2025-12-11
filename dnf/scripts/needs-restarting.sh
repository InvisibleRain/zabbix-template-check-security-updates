#!/bin/bash
set -e

/usr/bin/needs-restarting --services 2>/dev/null | /usr/bin/grep -v PID | /usr/bin/wc -l > /var/run/zabbix/needs-restarting
