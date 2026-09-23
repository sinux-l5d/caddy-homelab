FROM caddy:2.11.4-builder-alpine@sha256:8e89605351333ad2cc2f3bcc95275a2ccc427f88914050e86a5fde0fd77a63c4 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.4-alpine@sha256:6aeddd44c3078b0f9a35206472a11420648a79c184603ef95957d0a20044cb2b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
