#!/bin/bash

LOCK_FILE='/var/lib/mysql/wait.lock'
w_timeout=0
echo "Waiting init DB folders"
while [[ "$w_timeout" -lt 60 ]]; do
    [[ -e "$LOCK_FILE" ]] && break
    echo -n "."
    sleep 1
    ((w_timeout++)) || :
done
echo
source "/usr/local/bin/docker-entrypoint.sh"
mysql_note "MySQL init process done. Ready for start up mysqld $*"
_main mysqld "$@"
