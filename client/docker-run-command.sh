#!/bin/sh

docker build -t vla8islav/wireguard-debian-client:latest .
docker rm -f wireguard-client && docker run -v $(pwd)/wireguard-shared:/etc/wireguard --cap-add=NET_ADMIN --privileged \
	 --name=wireguard-client vla8islav/wireguard-debian-client:latest &
