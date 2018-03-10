#!/bin/bash

sed -i -e "s/%URBACKUP_DOMAIN_NAME%/"$URBACKUP_DOMAIN_NAME"/g" /etc/nginx/sites-available/urbackup
#dpkg -r urbackup-server
#dpkg -i /urbackup-server*.deb
apt-get update
apt-get install -y urbackup-server
mkdir -p /media/BACKUP/urbackup
#chmod -R 777 /media/BACKUP/urbackup
#chown -R urbackup.urbackup /media/BACKUP/urbackup
rm /first_run
