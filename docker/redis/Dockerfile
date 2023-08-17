FROM alpine:latest
LABEL author="Dmitry Fedunets <dmitry.fedunets@gmail.com>"
# Install libcgroup and tools for getting process limitations with cgget
RUN apk update && apk add libcgroup && apk add cgroup-tools
# install Redis
RUN apk add redis
# Start Redis server as main process
ENTRYPOINT [ "redis-server" ]
# For the future connecting to the Redis server
EXPOSE 6379
WORKDIR /data
#VOLUME /data

