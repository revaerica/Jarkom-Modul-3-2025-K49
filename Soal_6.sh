# Aldarion
echo "=========================================="
echo "   ALDARION DHCP SERVER CONFIGURATION"
echo "=========================================="

ip addr add 10.88.5.2/24 dev eth0
ip addr add 10.88.1.1/24 dev eth1
ip addr add 10.88.2.1/24 dev eth2
ip link set eth0 up
ip link set eth1 up
ip link set eth2 up

echo "=== IP Addresses ==="
ip addr show | grep "inet 10.88"

cat > /etc/dhcp/dhcpd.conf <<'EOF'
authoritative;

option domain-name "jarkomK49.com";
option domain-name-servers 10.88.3.2, 10.88.3.3;

subnet 10.88.1.0 netmask 255.255.255.0 {
    range 10.88.1.5 10.88.1.34;
    option routers 10.88.1.1;
    option broadcast-address 10.88.1.255;
    default-lease-time 1800;
    max-lease-time 3600;
}

subnet 10.88.2.0 netmask 255.255.255.0 {
    range 10.88.2.7 10.88.2.255;
    option routers 10.88.2.1;
    option broadcast-address 10.88.2.255;
    default-lease-time 600;
    max-lease-time 3600;
}

subnet 10.88.3.0 netmask 255.255.255.0 {}
subnet 10.88.4.0 netmask 255.255.255.0 {}
subnet 10.88.5.0 netmask 255.255.255.0 {}
EOF

cat > /etc/default/isc-dhcp-server <<'EOF'
INTERFACESv4="eth1 eth2"
INTERFACESv6=""
EOF

dhcpd -t -cf /etc/dhcp/dhcpd.conf
service isc-dhcp-server restart
service isc-dhcp-server status

echo ""
echo "=========================================="
echo "  ALDARION READY!"
echo "=========================================="
echo "✅ Manusia (10.88.1.x): 30 menit"
echo "✅ Peri (10.88.2.x): 10 menit"

# Gilgalad
echo "=========================================="
echo "   GILGALAD - CLIENT KELUARGA MANUSIA"
echo "=========================================="

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet dhcp
EOF

ip addr flush dev eth0
dhclient -r eth0 2>/dev/null
dhclient -v eth0

echo ""
echo "=== IP yang didapat ==="
ip addr show eth0 | grep "inet "

echo ""
echo "=== DNS Config ==="
cat /etc/resolv.conf

echo ""
echo "=== Lease Information ==="
cat /var/lib/dhcp/dhclient.leases | tail -15

echo ""
echo "Expected: 1800 seconds (30 minutes)"

# AMANDIL (Client Peri)
echo "=========================================="
echo "   AMANDIL - CLIENT KELUARGA PERI"
echo "=========================================="

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet dhcp
EOF

ip addr flush dev eth0
dhclient -r eth0 2>/dev/null
dhclient -v eth0

echo ""
echo "=== IP yang didapat ==="
ip addr show eth0 | grep "inet "

echo ""
echo "=== DNS Config ==="
cat /etc/resolv.conf

echo ""
echo "=== Lease Information ==="
cat /var/lib/dhcp/dhclient.leases | tail -15

echo ""
echo "Expected: 600 seconds (10 minutes)"

# Aldarion
echo "=========================================="
echo "   MONITORING DHCP LEASES"
echo "=========================================="

echo ""
echo "=== Active Leases ==="
cat /var/lib/dhcp/dhcpd.leases

echo ""
echo "=== Statistics ==="
grep "^lease" /var/lib/dhcp/dhcpd.leases | awk '{print $2}' | sort | uniq -c

echo ""
echo "=========================================="
echo "         TESTING COMPLETE!"
echo "=========================================="
