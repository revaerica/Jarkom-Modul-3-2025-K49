# Durin
sysctl -w net.ipv4.ip_forward=1

# DHCP Server (Aldarion)
apt-get update && apt-get install isc-dhcp-server -y
cat > /etc/default/isc-dhcp-server <<EOF
INTERFACESv4="eth0"
INTERFACESv6=""
EOF

cat > /etc/dhcp/dhcpd.conf <<EOF
subnet 10.88.1.0 netmask 255.255.255.0 {
    range 10.88.1.6 10.88.1.34;
    range 10.88.1.68 10.88.1.94;
    option routers 10.88.1.1;
    option broadcast-address 10.88.1.255;
    
    default-lease-time 600;
    max-lease-time 7200;
}
subnet 10.88.2.0 netmask 255.255.255.0 {
    range 10.88.2.35 10.88.2.67;
    range 10.88.2.96 10.88.2.121;
    option routers 10.88.2.1;
    option broadcast-address 10.88.2.255;
    
    default-lease-time 600;
    max-lease-time 7200;
}
host Khamul {
    hardware ethernet 02:42:92:bc:4c:00;
    fixed-address 10.88.3.95;
}
EOF

service isc-dhcp-server restart

# DHCP Relay (Durin/Router)
cat > /etc/default/isc-dhcp-relay << EOF
SERVERS="10.88.4.2"  
INTERFACES="eth1 eth2 eth3 eth4"
OPTIONS=""
EOF

cat > /etc/sysctl.conf << EOF
net.ipv4.ip_forward=1
EOF

sysctl -p
service isc-dhcp-relay restart

# Khamul (Fixed-Address)
cat > /etc/network/interfaces << EOF
hwaddress ether 02:42:92:bc:4c:00
EOF

ip a
cat /etc/default/isc-dhcp-server | grep INTERFACES
dhcpd -t -4
tail -n 20 /var/log/syslog | grep dhcp

