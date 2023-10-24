FROM golang:1.20-alpine3.17

ENV HOST_PORT=3000
ARG APP_DIR=/app

RUN apk --no-cache add curl
WORKDIR ${APP_DIR}

RUN addgroup -S wwdev
RUN adduser -S -D -h ${APP_DIR} ww1 wwdev
RUN chown -R ww1:wwdev ${APP_DIR}
USER ww1

COPY server.go ${APP_DIR}
COPY go.mod ${APP_DIR}

EXPOSE ${HOST_PORT}

HEALTHCHECK --interval=5s --start-period=5s CMD curl -f http://localhost:3000/trigger

CMD cd ${APP_DIR} && go run server.go

