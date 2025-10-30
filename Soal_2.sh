# DHCP Server (Aldarion)
cat > /etc/default/isc-dhcp-server <<EOF
INTERFACESv4="eth0"
INTERFACESv6=""
EOF

cat > /etc/dhcp/dhcpd.conf <<EOF
authoritative;
default-lease-time 600;
max-lease-time 7200;
option domain-name-servers 10.88.1.3, 192.168.122.1;

subnet 10.88.1.0 netmask 255.255.255.0 {
    range 10.88.1.6 10.88.1.34;
    range 10.88.1.68 10.88.1.94;
    option routers 10.88.1.1;
    option broadcast-address 10.88.1.255;
}

subnet 10.88.2.0 netmask 255.255.255.0 {
    range 10.88.2.35 10.88.2.67;
    range 10.88.2.96 10.88.2.121;
    option routers 10.88.2.1;
    option broadcast-address 10.88.2.255;
}

subnet 10.88.3.0 netmask 255.255.255.0 {
    option routers 10.88.3.1;
    option broadcast-address 10.88.3.255;
    host Khamul {
        hardware ethernet 02:42:92:bc:4c:00;
        fixed-address 10.88.3.95;
    }
}

subnet 10.88.4.0 netmask 255.255.255.0 {
    option routers 10.88.4.1;
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

ip a | grep 10.88.3.95

# Cek di DHCP-Client (Gilgalad & Amandil)
ip a | grep 10.88

