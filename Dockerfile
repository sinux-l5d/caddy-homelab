FROM caddy:2.11.9-builder-alpine@sha256:7d56ec51429d46ff6495db1542cc20e0a4e1559e766b2f4fc48ae25eeca16167 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.9-alpine@sha256:71d41fe4b1ae92a058abc87afe614178b996d8a6b96d0f4c71ae30606e5927e3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
