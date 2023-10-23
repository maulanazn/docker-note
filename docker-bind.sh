
podman container create --name server-postgres-1 --mount "type=bind,source=/home/maulanazn/Devstack/nyobaindocker/server-postgres-1,destination=/var/lib/postgresql/data" --publish 8000:5432 --env POSTGRES_USER=supersaiyan --env POSTGRES_PASSWORD=supersaiyan --memory 250m --cpus 1.2 postgres:16-alpine
