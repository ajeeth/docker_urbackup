#!/bin/sh

set -eu

sed -i -e "s/%URBACKUP_DOMAIN_NAME%/"$URBACKUP_DOMAIN_NAME"/g" /etc/nginx/sites-available/urbackup
mkdir -p /opt/urbackup/log
/usr/sbin/nginx -g "daemon off;" >> /opt/urbackup/log/service-nginx.log 2>&1
