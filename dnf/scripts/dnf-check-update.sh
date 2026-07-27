#!/bin/bash
result=$(/usr/bin/dnf check-update --security --quiet | wc -l)
echo $result > /var/run/zabbix/dnf-check-update
