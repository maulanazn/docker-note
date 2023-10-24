FROM alpine:latest

LABEL author="maulanazn"
LABEL company="weirdwire"

RUN mkdir hello

COPY text/greeting_*.txt hello/

CMD cat hello/greeting_*.txt && ls -l hello/