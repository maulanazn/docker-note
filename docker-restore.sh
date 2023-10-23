docker image pull ubuntu:latest

docker container run --rm --name ubuntu  --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1/backup,destination=/backup" --mount "type=volume,source=server-postgres-2,destination=/var/lib/postgresql/data" ubuntu:latest bash -c "cd /var/lib/postgresql/data && tar xvf /backup/postgres-server-1.tar.gz --strip 1"

docker container create --name server-postgres-2 --publish 8070:5432 --mount "type=volume,source=server-postgres-2,destination=/var/lib/postgresql/data" --env POSTGRES_USER=supersaiyan --env POSTGRES_PASSWORD=supersaiyan postgres:16-alpine