
```bash
export PGBADGER_VERSION=13.0
export PGBADGER_BUILD=0
podman build . --tag=docker.io/belidzs/pgbadger:latest --tag="docker.io/belidzs/pgbadger:$PGBADGER_VERSION-$PGBADGER_BUILD" --build-arg="PGBADGER_VERSION=$PGBADGER_VERSION"
podman push "docker.io/belidzs/pgbadger:$PGBADGER_VERSION-$PGBADGER_BUILD"
podman push docker.io/belidzs/pgbadger:latest
```