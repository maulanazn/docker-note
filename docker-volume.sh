docker container create --name server-postgres-1 --mount "type=volume,source=server-postgres-1-volume,destination=/var/lib/postgresql/data" --publish 8000:5432 --env POSTGRES_USER=supersaiyan --env POSTGRES_PASSWORD=supersaiyan --memory 450m --cpus 1.2 postgres:16-alpine

docker container rm server-postgres-1

docker volume create server-postgres-1-volume