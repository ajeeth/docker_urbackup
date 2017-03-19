#!/bin/bash

sed -i -e "s/%URBACKUP_DOMAIN_NAME%/"$URBACKUP_DOMAIN_NAME"/g" /etc/nginx/sites-available/urbackup
dpkg -r urbackup-server
dpkg -i /urbackup-server*.deb
mkdir -p /media/BACKUP/urbackup
chmod 777 /media/BACKUP/urbackup
chown urbackup.urbackup /media/BACKUP/urbackup
rm /first_run
