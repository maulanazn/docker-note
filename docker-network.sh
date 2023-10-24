docker network create --driver bridge contohnetwork
docker network create --driver host contohnetwork
docker network create --driver none contohnetwork

docker network rm contohnetwork