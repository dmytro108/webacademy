docker run -d --network="host" --rm  --name Redis -v ./RedisData:/data my-redis:latest
docker run -d --network="host" --rm  --name my-app-py my-app:latest
