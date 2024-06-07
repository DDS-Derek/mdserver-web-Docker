FROM ddsderek/mdserver-web:lnp

ARG MYSQL_VERSION=5.7
ARG PHPMYADMIN_VERSION=4.4.15
ARG DEBIAN_FRONTEND="noninteractive"

RUN cd /www/server/mdserver-web/plugins/mysql && \
    bash install.sh install ${MYSQL_VERSION} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /var/log/* \
        /root/.cache

RUN cd /www/server/mdserver-web/plugins/phpmyadmin && \
    bash install.sh install ${PHPMYADMIN_VERSION} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /var/log/* \
        /root/.cache
