FROM caddy:2.11.9-builder-alpine@sha256:7d56ec51429d46ff6495db1542cc20e0a4e1559e766b2f4fc48ae25eeca16167 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.9-alpine@sha256:0bbb055bda6793c999bde78b1b5ce3e89f829fb031af2cf50056ea1246559fee

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
