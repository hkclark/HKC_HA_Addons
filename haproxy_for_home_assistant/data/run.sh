#!/usr/bin/env bashio
set -e

cat /ssl/fullchain.pem /ssl/privkey.pem > /ssl/combo.pem

CONFIGFILE=$(bashio::config 'configfile')

cp $CONFIGFILE /etc/haproxy/haproxy.cfg

# start server
bashio::log.info "Running HAProxy..."
exec haproxy -f /etc/haproxy/haproxy.cnf < /dev/null
