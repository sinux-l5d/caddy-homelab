FROM caddy:2.11.6-builder-alpine@sha256:096ec6e825e219175bd5be64b5e7a4000977f701a2bcaab825621d9fb1e1154b AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.6-alpine@sha256:c776e0c6413b544d0459665e54ec7b8b2a15000c0cbee8b254da0067b1d184ff

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
