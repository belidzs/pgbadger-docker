ARG PGBADGER_VERSION=11.6

FROM ubuntu:20.04 AS build
ARG PGBADGER_VERSION
WORKDIR /tmp

RUN apt update && apt install -y build-essential wget
RUN wget "https://github.com/darold/pgbadger/archive/v$PGBADGER_VERSION.tar.gz" && \
        tar xzf "v$PGBADGER_VERSION.tar.gz"

WORKDIR /tmp/pgbadger-${PGBADGER_VERSION}

RUN perl Makefile.PL && make

FROM alpine:3
ARG PGBADGER_VERSION

COPY --from=build /tmp/pgbadger-${PGBADGER_VERSION} /opt/pgbadger
RUN apk update && apk add perl
RUN ln -s "/opt/pgbadger/pgbadger" /usr/local/bin/pgbadger

CMD ["/opt/pgbadger/pgbadger", "--version"]

