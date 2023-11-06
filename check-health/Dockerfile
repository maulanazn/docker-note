FROM golang:1.20-alpine3.17 as builder

ARG APP_DIR=/app

WORKDIR ${APP_DIR}

RUN apk --no-cache add curl
RUN addgroup -S wwdev
RUN adduser -S -D -h ${APP_DIR} ww1 wwdev
RUN chown -R ww1:wwdev ${APP_DIR}
USER ww1

COPY server.go ${APP_DIR}

RUN go build -o ${APP_DIR}/main server.go

HEALTHCHECK --interval=5s --start-period=5s CMD curl -f http://localhost:3000/trigger

FROM alpine:latest

WORKDIR /app/

COPY --from=builder /app/main ./
COPY hello.sh /app/hello.sh

RUN chmod +x /app/hello.sh
RUN /app/hello.sh

CMD /app/main
