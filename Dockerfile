FROM caddy:2.11.7-builder-alpine@sha256:a576be4d0ba99e7259e98268cbac2e2c897feeab8b7b49885cd3cac5409523f8 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.7-alpine@sha256:e70b164da81ef698b3ad19af799ea6086ce6d9e48ed4079eb9fe26f6fbf14ee5

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
