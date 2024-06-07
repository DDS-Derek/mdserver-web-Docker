#!/bin/bash
# shellcheck disable=SC1091

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
if [ "${CLOSE_ADMIN_PATH}" == true ]; then
    mw close_admin_path
fi
source /www/server/mdserver-web/bin/activate
cd /www/server/mdserver-web || exit
python /www/server/mdserver-web/plugins/mysql/index.py fix_db_access {}
deactivate
cd /

/etc/init.d/mw start
/www/server/openresty/init.d/openresty start
/www/server/php/init.d/php74 start
/www/server/mysql/init.d/mysql start
/usr/sbin/cron
if [ ! -d /run/sshd ]; then
    mkdir -p /run/sshd
fi
/usr/sbin/sshd -e -f /etc/ssh/sshd_config

mw default

tail -f /dev/null
