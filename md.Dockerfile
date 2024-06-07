FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND="noninteractive"

RUN set -ex && \
    apt update -y && \
    apt install curl nano ssh -y && \
    curl --insecure -fsSL https://cdn.jsdelivr.net/gh/midoks/mdserver-web@latest/scripts/install.sh | bash && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /var/log/* \
        /root/.cache
