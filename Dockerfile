FROM caddy AS caddy
FROM debian
COPY --from=caddy /usr/bin/caddy /bin/caddy
COPY ./build/dist /srv/build
COPY ./build/node-template /bin/node-template
