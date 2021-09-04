#!/usr/bin/env bashio
set -e

DHPARAMS_PATH=/data/dhparams.pem

#DOMAIN=$(bashio::config 'domain')
#KEYFILE=$(bashio::config 'keyfile')
#CERTFILE=$(bashio::config 'certfile')
CONFIGFILE=$(bashio::config 'configfile')

#CUSTOMIZE_SERVERS=$(bashio::config 'customize.servers')
#sed -i "s|#include /share/nginx_proxy/.*|include /share/$CUSTOMIZE_SERVERS;|" /etc/nginx.conf
cp $CONFIGFILE /etc/nginx.conf

# start server
bashio::log.info "Running nginx..."
exec nginx -c /etc/nginx.conf < /dev/null
