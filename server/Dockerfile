FROM debian:bullseye

RUN apt update && apt install wireguard iproute2 -y
RUN apt install htop vim -y
RUN apt install iptables iputils-ping -y
CMD \
echo 1 > /proc/sys/net/ipv4/ip_forward && \
ip link add wg0 type wireguard && \
ip addr add ${SERVER_LOCAL_ADDRESS_IP} peer ${CLIENT_LOCAL_ADDRESS_IP} dev wg0 &&\
ip link set up wg0 &&\
wg setconf wg0 /etc/wireguard/wg0.conf && \
DOCKER_CURRENT_IP=$(hostname -i) &&\
iptables -t nat -A PREROUTING -d $DOCKER_CURRENT_IP -p udp --dport ${SERVER_PORT}  -j RETURN &&\
iptables -t nat -A PREROUTING -d $DOCKER_CURRENT_IP -j DNAT --to-destination ${CLIENT_LOCAL_ADDRESS_IP} &&\
iptables -t nat -A POSTROUTING -d ${CLIENT_LOCAL_ADDRESS_IP} -j SNAT --to-source ${SERVER_LOCAL_ADDRESS_IP} &&\
while true; do sleep 30; done;
