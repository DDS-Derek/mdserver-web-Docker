# mdserver-web-Docker

mdserver-web docker image

## Run

```shell
docker run -d \
    --net=host \
    -e CLOSE_ADMIN_PATH=true \
    -e USERNAME=ddsrem \
    -e PASSWORD=password \
    -e WEB_PORT=7200 \
    --restart unless-stopped \
    --name=mw \
    ddsderek/mdserver-web:latest
```
