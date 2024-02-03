FROM debian:bookworm-slim

ARG DEBIAN_FRONTEND="noninteractive"

RUN set -ex && \
    apt update -y && \
    apt install curl -y && \
    curl --insecure -fsSL https://cdn.jsdelivr.net/gh/midoks/mdserver-web@latest/scripts/install.sh | bash