#!/bin/sh

echo "Starting mirror"
/mirror.sh
#
# see https://github.com/xordiv/docker-alpine-cron
#
crond -s /var/spool/cron/crontabs -b -L /var/log/cron.log "$@" && tail -f /var/log/cron.log &

echo "Mirror started"
/usr/local/bin/httpd-foreground
rm -f /usr/local/apache2/htdocs/*.html


