ARG COMPOSE_VERSION=1.29.2

FROM curlimages/curl:7.81.0 AS reflex
WORKDIR /tmp
RUN curl -L https://github.com/cespare/reflex/releases/download/v0.3.1/reflex_linux_amd64.tar.gz \
    | tar -zxv


FROM docker/compose:alpine-${COMPOSE_VERSION}
RUN apk add --no-cache bash

COPY --from=reflex  /tmp/reflex_linux_amd64/reflex /usr/bin/reflex
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]