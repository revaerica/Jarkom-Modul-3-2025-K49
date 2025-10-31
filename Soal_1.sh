# Durin
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth0 -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth4 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth5 -j ACCEPT

iptables -A INPUT -i eth1 -p icmp -j ACCEPT 
iptables -A INPUT -i eth2 -p icmp -j ACCEPT 
iptables -A INPUT -i eth3 -p icmp -j ACCEPT 
iptables -A INPUT -i eth4 -p icmp -j ACCEPT 
iptables -A INPUT -i eth5 -p icmp -j ACCEPT

cat > /etc/default/isc-dhcp-relay << EOF
SERVERS="10.88.4.2"  
INTERFACES="eth1 eth2 eth3 eth4 eth5"
OPTIONS=""
EOF

service isc-dhcp-relay restart

# Gilgalad dan Amandil
# Amandil
ip addr flush dev eth0
ip addr add 10.88.1.100/24 dev eth0
ip link set eth0 up
ip route add default via 10.88.1.1

# Gilgalad
ip addr flush dev eth0
ip addr add 10.88.2.100/24 dev eth0
ip link set eth0 up
ip route add default via 10.88.2.1

echo nameserver 192.168.122.1 > /etc/resolv.conf

ping -c 3 10.88.1.1     
ping -c 3 10.88.2.1     
ping -c 3 192.168.122.1 

apt-get update
apt-get install isc-dhcp-client -y

echo nameserver 10.88.5.2 > /etc/resolv.conf
