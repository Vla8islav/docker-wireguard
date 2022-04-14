#!/bin/sh

docker build -t vla8islav/wireguard-debian-server:latest .
docker rm -f wireguard-server && \
docker run \
-v $(pwd)/wireguard-shared:/etc/wireguard \
--cap-add=NET_ADMIN \
--name=wireguard-server \
-p 12345:12345/udp -p 12346:12346 \
--privileged \
--env-file ../.env \
vla8islav/wireguard-debian-server:latest &
