FROM caddy:2.11.9-builder-alpine@sha256:d26fbc8a56ed8c3c1534f5573162d148ad3ed41732665da8526eb181fac0b728 AS builder

RUN xcaddy build --with github.com/caddy-dns/ovh

FROM caddy:2.11.9-alpine@sha256:71d41fe4b1ae92a058abc87afe614178b996d8a6b96d0f4c71ae30606e5927e3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
