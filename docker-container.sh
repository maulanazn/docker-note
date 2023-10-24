docker container ls

docker container create --name redis1 --publish 4000:6379 redis

docker container exec -it redis1 /bin/bash

docker container stop redis1

docker container rm redis1
