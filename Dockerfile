FROM caddy:2.11.7-builder-alpine@sha256:a576be4d0ba99e7259e98268cbac2e2c897feeab8b7b49885cd3cac5409523f8 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.7-alpine@sha256:eb4d35b7452d1ab6171fbdbe8d9275b2301dad6dad92115d91e19fb9b24d510f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
