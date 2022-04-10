FROM debian:bullseye

RUN apt update && apt install wireguard iproute2 -y
RUN apt install htop vim -y
RUN apt install iptables iputils-ping -y
CMD \
echo 1 > /proc/sys/net/ipv4/ip_forward && \
ip link add wg0 type wireguard && \
ip addr add 10.13.13.1 peer 10.13.14.1/32 dev wg0 &&\
ip link set up wg0 &&\
wg setconf wg0 /etc/wireguard/wg0.conf && \
iptables -t nat -A PREROUTING -d 172.17.0.2 -p udp --dport 12345  -j RETURN &&\
iptables -t nat -A PREROUTING -d 172.17.0.2 -j DNAT --to-destination 10.13.14.1 &&\
iptables -t nat -A POSTROUTING -j SNAT -d 10.13.14.1 --to-source 10.13.13.1 &&\
 sleep 10000
