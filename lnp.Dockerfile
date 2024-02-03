FROM ddsderek/mdserver-web:md

ARG OPENRESTY_VERSION=1.21.4.3
ARG PHP_VERSION=74
ARG DEBIAN_FRONTEND="noninteractive"

RUN cd /www/server/mdserver-web/plugins/openresty && \
    bash install.sh install ${OPENRESTY_VERSION} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /var/log/* \
        /root/.cache

RUN cd /www/server/mdserver-web/plugins/php && \
    bash install.sh install ${PHP_VERSION} && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /var/log/* \
        /root/.cache