FROM golang:latest

ENV HOST_PORT=3000

RUN mkdir testhello

COPY server.go testhello

EXPOSE ${HOST_PORT}

CMD cd testhello && go run server.go

