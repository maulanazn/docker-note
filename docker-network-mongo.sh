docker image pull mongo-express:latest

docker network create java-server

docker container run --rm --name ubuntu  --mount "type=bind,source=/home/maulanazn/Devstack/docker-note/backup,destination=/backup" --mount "type=volume,source=bogor-volume,destination=/data/db" ubuntu:latest bash -c "cd /data/db && tar xvf /backup/mongo-server-1.tar.gz --strip 1"

docker container create --name mongo-server-bogor --network java-server --volume bogor-volume:/data/db --env MONGO_INITDB_ROOT_USERNAME=maulanazn --env MONGO_INITDB_ROOT_PASSWORD=maulanazn123 mongo:jammy

docker container create --name mongo-server-center --network java-server --publish 8081:8081 --volume bogor-volume:/data/db --env ME_CONFIG_MONGODB_URL="mongodb://maulanazn:maulanazn123@mongo-server-bogor:27017/" --env ME_CONFIG_BASICAUTH_USERNAME=admin --env ME_CONFIG_BASICAUTH_PASSWORD=admin123 --env ME_CONFIG_MONGODB_ENABLE_ADMIN=true --env ME_CONFIG_MONGODB_ADMINUSERNAME=admin --env ME_CONFIG_MONGODB_ADMINPASSWORD=admin123 mongo-express:latest

docker container start mongo-server-bogor

docker container start mongo-server-center

docker container run --rm --name ubuntu --mount "type=bind,source=/home/maulanazn/Devstack/docker-note/backup,destination=/backup" --mount "type=volume,source=bogor-volume,destination=/data/db" ubuntu:latest tar cvf /backup/mongo-server-1.tar.gz /data/db