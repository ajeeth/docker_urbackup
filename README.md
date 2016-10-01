# docker_urbackup

This docker container provides urbackup server fronted by Nginx webserver on Ubuntu 16.04.


Run command:
docker run --privileged -d --name urbackup --restart=always -p 443:443 -p 55415:55415 -p 35623:35623/udp -v /etc/localtime:/etc/localtime:ro -v /<path>/urbackup/certs:/opt/urbackup/certs -v /<path>/urbackup/log:/opt/urbackup/log -v /<path>/urbackup/BACKUP:/media/BACKUP -v /<path>/urbackup/var:/var/urbackup -e URBACKUP_DOMAIN_NAME=urbackup.domain.com ajeeth/urbackup:2.0.34

Please setup the following directory structure on Host
/<path>/urbackup/certs
/<path>/urbackup/log
/<path>/urbackup/var
/<path>/urbackup/BACKUP

/<path>/urbackup/certs to contain domain.crt and domain.key. This will be picked up and used by Nginx webserver. Be sure to match the certificate domain to the URBACKUP_DOMAIN_NAME argument while running the container.

/<path>/urbackup/var contains urbackup database installation, server_ident.pub and server_ident.key files.

/<path>/urbackup/BACKUP is location where that file and image backups are stored. This partition should be sized as per your backup requirements.
