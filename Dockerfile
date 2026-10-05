FROM caddy:2.11.6-builder-alpine@sha256:b0a9daab97b413316e23238e5d466849b0ebbba8d411f7344e084d9f51fe973a AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.6-alpine@sha256:d44355d3c2149dc580ce2cac735955d1c08d3d00882c30489c241aa51a5c10d9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
