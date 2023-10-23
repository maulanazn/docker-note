docker image pull ubuntu:latest

docker container run --rm --name ubuntubackup  --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1/backup,destination=/backup" --mount "type=volume,source=server-postgres-1-volume,destination=/var/lib/postgresql/data" ubuntu:latest tar cvf /backup/postgres-server-1.tar.gz /var/lib/postgresql/data