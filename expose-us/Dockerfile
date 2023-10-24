FROM golang:latest

ENV HOST_PORT=3000
ARG APP_DIR=/app
ARG APP_DATA=/logs

WORKDIR ${APP_DIR}/${APP_DATA}

RUN addgroup ww-dev
RUN adduser -S -D -h ${APP_DIR}/${APP_DATA} ww-1 ww-dev
RUN chown -R ww-1:ww-dev /app/logs
USER ww-1

COPY server.go ${APP_DIR}
COPY go.mod ${APP_DIR}

EXPOSE ${HOST_PORT}
VOLUME ${APP_DATA}

CMD cd ${APP_DIR} && go run server.go

