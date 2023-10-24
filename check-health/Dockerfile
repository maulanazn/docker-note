FROM golang:1.20-alpine3.17 as builder

ARG APP_DIR=/app

RUN apk --no-cache add curl
WORKDIR ${APP_DIR}

RUN addgroup -S wwdev
RUN adduser -S -D -h ${APP_DIR} ww1 wwdev
RUN chown -R ww1:wwdev ${APP_DIR}
USER ww1

COPY server.go ${APP_DIR}

HEALTHCHECK --interval=5s --start-period=5s CMD curl -f http://localhost:3000/trigger

RUN go build -o ${APP_DIR}/main server.go

FROM alpine:latest

WORKDIR /app/

COPY --from=builder /app/main ./

CMD /app/main
