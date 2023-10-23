docker image pull mongo:jammy

docker container create --name mongo-service --publish 8080:27017 --mount "type=volume,source=mongo-volume,destination=/data"  --memory 450m --cpus 1.0  mongo:jammy

docker container run --rm --name ubuntumongo-backup  --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1/backup,destination=/backup" --mount "type=volume,source=mongo-volume,destination=/data" ubuntu:latest tar cvf /backup/mongo-server-1.tar.gz /data

docker container run --rm --name ubuntumongo-restore --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1/backup,destination=/backup" --mount "type=volume,source=mongo-new-volume,destination=/data/db" ubuntu:latest bash -c "cd /data && tar xvf /backup/mongo-server-1.tar.gz --strip 1"

docker container create --name mongo-new-service --publish 8080:27017 --mount "type=volume,source=mongo-new-volume,destination=/data" --env MONGO_INITDB_ROOT_USERNAME=maulanazn --env MONGO_INITDB_ROOT_PASSWORD=maulanazn123 --memory 450m --cpus 1.0  mongo:jammy