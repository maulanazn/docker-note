FROM golang:1.20-alpine3.17 as builder

ENV HOST_PORT=3000
ENV MODE=dev
ARG APP_DIR=/app

WORKDIR ${APP_DIR}

RUN addgroup -S wwdev
RUN adduser -S -D -h ${APP_DIR} ww1 wwdev
RUN chown -R ww1:wwdev ${APP_DIR}
USER ww1

COPY main.go ${APP_DIR}

RUN go build -o ${APP_DIR}/main main.go

FROM alpine:latest

WORKDIR /app/

COPY --from=builder /app/main ./

CMD /app/main
