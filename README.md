# [docker_urbackup](https://github.com/ajeeth/docker_urbackup) / [urbackup_auto](https://hub.docker.com/r/ajeeth/urbackup_auto)

This docker container provides urbackup server fronted by Nginx webserver on Ubuntu 16.04.


To run the container execute:
```bash
docker run --privileged -d --name urbackup --restart=always -p 443:443 -p 55413-55415:55413-55415 -p 35623:35623/udp -v /etc/localtime:/etc/localtime:ro -v /<path>/urbackup/certs:/opt/urbackup/certs -v /<path>/urbackup/log:/opt/urbackup/log -v /<path>/urbackup/BACKUP:/media/BACKUP -v /<path>/urbackup/var:/var/urbackup -e URBACKUP_DOMAIN_NAME=<urbackup.domain.com> ajeeth/urbackup_auto:<version>
```

Setup the following directory structure on Host before running the above command.

```
/<path>/urbackup/certs
/<path>/urbackup/log
/<path>/urbackup/var
/<path>/urbackup/BACKUP
```
Add certificate and key named as domain.crt and domain.key to `/<path>/urbackup/certs`. This will be picked up and used by Nginx webserver. Be sure to match the certificate domain to the `URBACKUP_DOMAIN_NAME` argument while running the container.

`/<path>/urbackup/var` contains urbackup database installation, server_ident.pub and server_ident.key files.

`/<path>/urbackup/BACKUP` is location where that file and image backups are stored. This partition should be sized as per your backup requirements.

---
### Running urbackupsrv commands

Urbackupsrv urbackupsrv commands can be run by passing the command argument to the variable `RUNCMD`.

Following example passes `remove-unknown` to urbackupsrv. After execution, docker container exits and is removed.

```bash
docker run --privileged --rm --name urbackup2 -v /etc/localtime:/etc/localtime:ro -v /<path>/urbackup/log:/opt/urbackup/log -v /<path>/urbackup/BACKUP:/media/BACKUP -v /<path>/urbackup/var:/var/urbackup -e URBACKUP_DOMAIN_NAME=<urbackup.domain.com> -e RUNCMD=remove-unknown ajeeth/urbackup_auto:<version>
```


---

docker hub url: https://hub.docker.com/r/ajeeth/urbackup_auto

git hub url: https://github.com/ajeeth/docker_urbackup
