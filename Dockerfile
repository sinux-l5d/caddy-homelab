FROM caddy:2.11.8-builder-alpine@sha256:661f29bb0de2c3ea5eb9cae5783e1c907ef7daa13a4b7db5207c710f51854e4a AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.8-alpine@sha256:f6228111e5fafa1a5238258d0858e103f10599b8d1659a146e7726681a002bb9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
