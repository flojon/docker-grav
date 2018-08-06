#!/bin/sh
set -e

message=""

if [ -z "$(ls -A /var/www/html)" ]; then
	message="Grav not found in $PWD - copying now..."
else
	# trick sort -V to handle -alpha, -beta, -rc etc. See https://stackoverflow.com/a/40391207
	newest_version=`sed -n "s/^define('GRAV_VERSION', '\(.*\)');$/\1/p" system/defines.php /usr/src/grav-admin/system/defines.php | sed '/-/!{s/$/_/}' | sort -V | tail -1`
	current_version=`sed -n "s/^define('GRAV_VERSION', '\(.*\)');$/\1/p" system/defines.php | sed '/-/!{s/$/_/}'`
	if [ $newest_version != $current_version ]; then
		message="Newer version of Grav found - copying now..."
	fi
fi

if [ -n "$message" ]; then
	echo $message
	cp -a /usr/src/grav-admin/. /var/www/html/
	chown -R www-data:www-data /var/www/html
	if [ "$GRAV_REVERSE_PROXY" = "true" ]; then
		sed -i "s/reverse_proxy_setup:\sfalse/reverse_proxy_setup: true/g" \
		        system/config/system.yaml
	fi
fi

exec "$@"