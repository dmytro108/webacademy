FROM alpine:latest
LABEL author="Dmitry Fedunets <dmitry.fedunets@gmail.com>"
RUN apk update && apk add libcgroup && apk add cgroup-tools
RUN apk add redis
ENTRYPOINT [ "redis-server" ]
EXPOSE 6379
WORKDIR /data
#VOLUME /data
