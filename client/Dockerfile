FROM debian:bullseye

RUN apt update && apt install wireguard iproute2 -y
RUN apt install htop vim -y
CMD ip link add wg0 type wireguard && \
ip addr add ${CLIENT_LOCAL_ADDRESS_IP} peer ${SERVER_LOCAL_ADDRESS_IP} dev wg0 &&\
ip link set up wg0 &&\
wg setconf wg0 /etc/wireguard/wg0.conf && \
 sleep 10000
