#!/bin/bash
/usr/bin/dnf check-update --security --quiet | wc -l > /var/run/zabbix/dnf-check-update
