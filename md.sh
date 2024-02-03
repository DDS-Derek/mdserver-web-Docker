#!/bin/bash

if [ -n "${WEB_PORT}" ]; then
    echo "${WEB_PORT}" > /www/server/mdserver-web/data/port.pl
fi
cd /www/server/mdserver-web || exit
if [ -n "${USERNAME}" ]; then
    /www/server/mdserver-web/bin/python tools.py username "${USERNAME}"
fi
if [ -n "${PASSWORD}" ]; then
    /www/server/mdserver-web/bin/python tools.py panel "${PASSWORD}"
fi
cd /

/etc/init.d/mw start
/www/server/openresty/init.d/openresty start
/www/server/php/init.d/php74 start
/www/server/mysql/init.d/mysql start

mw default

tail -f /dev/null