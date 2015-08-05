#!/bin/bash

if ! [ -d /data/conf/puppetserver ]; then
    printf "Initializing config because no configuration was found\n"
    cp -fr /etc/puppetlabs/* /data/conf
fi

printf "Linking mounted config directory\n"
rm -rf /etc/puppetlabs
ln -s /data/conf /etc/puppetlabs

if ! [ -d /data/log ]; then
    printf "\n"
    mkdir -p /data/log
    mv /var/log/* /data/log/
fi

printf "Linking mounted logs directory\n"
rm -rf /var/log
ln -s /data/log /var/log

printf "Running supervisord to start puppetserver\n"
exec supervisord -n -c /etc/supervisor/supervisord.conf
