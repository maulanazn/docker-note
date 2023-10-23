docker image pull mongo:jammy

docker volume create surakarta-volume

docker container run -d --name mongo-server-surakarta --publish 8080:27017 --volume surakarta-volume:/data/db --env MONGO_INITDB_ROOT_USERNAME=maulanazn --env MONGO_INITDB_ROOT_PASSWORD=maulanazn123 mongo:jammy

docker container run --rm --name ubuntumongo-backup  --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1/backup,destination=/backup" --volume surakarta-volume:/data ubuntu:latest tar cvf /backup/mongo-server-1.tar.gz /data/db

docker volume create bogor-volume

docker container run --rm --name ubuntumongo-restore --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1/backup,destination=/backup" --volume bogor-volume:/data ubuntu:latest bash -c "cd /data && tar xvf /backup/mongo-server-1.tar.gz --strip 1"

docker container run -d --name mongo-server-bogor --publish 8080:27017 --volume bogor-volume:/data/db --env MONGO_INITDB_ROOT_USERNAME=maulanazn --env MONGO_INITDB_ROOT_PASSWORD=maulanazn123 mongo:jammy

docker container stop mongo-server-bogor