FROM caddy:2-builder AS builder

RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENV CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}
ENV ACMEEMAIL=${ACMEEMAIL}
ENV ASAK=${ASAK}
ENV XADMIN=${XADMIN}