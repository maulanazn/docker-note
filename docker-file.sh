docker build -t hellounix src
docker container run --rm --name hellounix hellounix:latest

# EXPOSE
docker build -t hellogolang expose-us
docker container create --name rungolang --publish 3000:3000 hellogolang:latest
docker container start rungolang

# ENV
docker build -t hellogolang expose-us
docker container create --name rungolang --env HOST_PORT=3000 --publish 3000:3000 hellogolang:latest
docker container start rungolang

# VOLUME
docker build -t golang-volume expose-us
docker container create --name golangvolume --env HOST_PORT=3000 --publish 3000:3000 golang-volume:latest
docker container start golangvolume