FROM alpine:latest
MAINTAINER Jeroen van Baarsen <@jvanbaarsen>

RUN apk update && apk add --update darkhttpd && \
  apk add --update curl && \
  apk add --update openssl

EXPOSE 80

WORKDIR /certs
COPY ["./entry.sh", "/usr/local/bin/"]
ENTRYPOINT ["/usr/local/bin/entry.sh"]

