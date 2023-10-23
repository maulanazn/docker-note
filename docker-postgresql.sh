# podman container ls

podman container create --name server-postgres-1 --publish 8000:5432 --env POSTGRES_USER=supersaiyan --env POSTGRES_PASSWORD=supersaiyan --memory 250m --cpus 1.2 postgres:16-alpine

podman container create --name nginx-only --publish 8080:80 --memory 96m --cpus 0.5 nginx:latest