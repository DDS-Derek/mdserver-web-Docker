FROM ddsderek/mdserver-web:lnmp

COPY --chmod=755 md.sh /md.sh

ENTRYPOINT [ "/md.sh" ]