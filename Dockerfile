FROM caddy:2.11.7-builder-alpine@sha256:a576be4d0ba99e7259e98268cbac2e2c897feeab8b7b49885cd3cac5409523f8 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.7-alpine@sha256:d8542f48d34a9cf4e4c11a478865229840e87e4c96ea3f439101f31a5d35f75f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
