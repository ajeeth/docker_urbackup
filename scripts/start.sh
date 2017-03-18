#!/bin/bash

# Stop on error
#set -eu

if [ "$USEEXTVOL" = true ] ; then
	#mount ext nfs share; check if it is already mounted
	ttt=`mount|grep nfs`
	echo $ttt
	if [ -z "$ttt" ]; then
		# No NFS shares mounted
		mounts=$NFSSHARE
		targets=()
		rpcbind
		for mnt in "${mounts[@]}"; do
			src=$(echo $mnt | awk -F':' '{ print $1 }')
			target=$(echo $mnt | awk -F':' '{ print $2 }')
			targets+=("$target")
			mkdir -p $target
			mount -t nfs -o proto=tcp,port=2049 ${NFS_PORT_2049_TCP_ADDR}:${src} ${target}
		done
#		exec inotifywait -m "${targets[@]}"
		sleep 30
	fi
	echo "NFS Mounts: " `mount|grep nfs` 
fi

if [ -n "$RUNCMD" ] ; then
	RUNCMD=${RUNCMD=//\"/}
	/usr/bin/urbackupsrv "$RUNCMD";
	rm -f /root/scripts/first_run.sh	
else
	if [[ -e /first_run ]]; then
		/root/scripts/first_run.sh
		echo firstrun
	else
		echo not first run
		/root/scripts/normal_run.sh
	fi
	exec /usr/bin/urbackupsrv run
fi
