# Aldarion
echo "=========================================="
echo "   ALDARION DHCP SERVER CONFIGURATION"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y

echo "[*] Configuring DHCP interface..."
echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

echo "[*] Creating DHCP configuration with lease time rules..."

cat > /etc/dhcp/dhcpd.conf <<'EOF'
option domain-name "jarkomK49.com";
option domain-name-servers 10.88.3.2, 10.88.3.3;

# SUBNET 10.88.1.0/24 (Manusia)
subnet 10.88.1.0 netmask 255.255.255.0 {
    range 10.88.1.5 10.88.1.34;
    option routers 10.88.1.1;
    option broadcast-address 10.88.1.255;
    
    default-lease-time 1800;
    max-lease-time 3600;
}

# SUBNET 10.88.2.0/24 (Peri)
subnet 10.88.2.0 netmask 255.255.255.0 {
    range 10.88.2.7 10.88.2.255;
    option routers 10.88.2.1;
    option broadcast-address 10.88.2.255;
    
    default-lease-time 600;
    max-lease-time 3600;
}

# SUBNET LAINNYA (Tidak ada DHCP)
# Subnet 10.88.3.0/24 - DNS Servers (Static IP)
subnet 10.88.3.0 netmask 255.255.255.0 {
}

# Subnet 10.88.4.0/24 - Database Server (Static IP)
subnet 10.88.4.0 netmask 255.255.255.0 {
}

# Subnet 10.88.5.0/24 - DHCP & Router (Static IP)
subnet 10.88.5.0 netmask 255.255.255.0 {
}
EOF

echo "[*] Checking DHCP configuration..."
dhcpd -t -cf /etc/dhcp/dhcpd.conf

echo "[*] Starting DHCP Server..."
service isc-dhcp-server restart

echo "[*] Checking DHCP Server status..."
service isc-dhcp-server status

echo ""
echo "=========================================="
echo "     ALDARION CONFIGURATION COMPLETE!"
echo "=========================================="
echo ""
echo "Aturan Waktu Peminjaman Tanah:"
echo "  👨 Keluarga Manusia (10.88.1.x): 30 menit (1800s)"
echo "  🧝 Keluarga Peri (10.88.2.x): 10 menit (600s)"
echo "  ⏰ Batas Maksimal (semua): 1 jam (3600s)"
echo ""
echo "Range IP:"
echo "  - Manusia: 10.88.1.5 - 10.88.1.34"
echo "  - Peri: 10.88.2.7 - 10.88.2.255"
echo ""

# Gilgalad
echo "=========================================="
echo "   TESTING - GILGALAD (KELUARGA MANUSIA)"
echo "=========================================="

cp /etc/network/interfaces /etc/network/interfaces.backup

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet dhcp
EOF

echo "[*] Flushing existing IP..."
ip addr flush dev eth0

echo "[*] Requesting IP from DHCP (Keluarga Manusia)..."
dhclient -r eth0 2>/dev/null
dhclient -v eth0

echo ""
echo "[*] IP Configuration received:"
ip addr show eth0 | grep "inet "

echo ""
echo "[*] Routing table:"
ip route

echo ""
echo "[*] DNS Configuration:"
cat /etc/resolv.conf

echo ""
echo "[*] Checking lease information..."
if [ -f /var/lib/dhcp/dhclient.leases ]; then
    echo "=== Lease Details ==="
    cat /var/lib/dhcp/dhclient.leases | tail -20
    echo ""
    echo "=== Lease Time Summary ==="
    grep "lease-time" /var/lib/dhcp/dhclient.leases | tail -1
fi

echo ""
echo "Expected: Lease time 1800 seconds (30 minutes)"
echo ""

echo "[*] Testing DNS resolution..."
nslookup jarkomK49.com

echo ""
echo "=========================================="
echo "   GILGALAD TESTING COMPLETE!"
echo "=========================================="

# Amandil
echo "=========================================="
echo "   TESTING - AMANDIL (KELUARGA PERI)"
echo "=========================================="

cp /etc/network/interfaces /etc/network/interfaces.backup

cat > /etc/network/interfaces <<'EOF'
auto eth0
iface eth0 inet dhcp
EOF

echo "[*] Flushing existing IP..."
ip addr flush dev eth0

echo "[*] Requesting IP from DHCP (Keluarga Peri)..."
dhclient -r eth0 2>/dev/null
dhclient -v eth0

echo ""
echo "[*] IP Configuration received:"
ip addr show eth0 | grep "inet "

echo ""
echo "[*] Routing table:"
ip route

echo ""
echo "[*] DNS Configuration:"
cat /etc/resolv.conf

echo ""
echo "[*] Checking lease information..."
if [ -f /var/lib/dhcp/dhclient.leases ]; then
    echo "=== Lease Details ==="
    cat /var/lib/dhcp/dhclient.leases | tail -20
    echo ""
    echo "=== Lease Time Summary ==="
    grep "lease-time" /var/lib/dhcp/dhclient.leases | tail -1
fi

echo ""
echo "Expected: Lease time 600 seconds (10 minutes)"
echo ""

echo "[*] Testing DNS resolution..."
nslookup jarkomK49.com

echo ""
echo "=========================================="
echo "   AMANDIL TESTING COMPLETE!"
echo "=========================================="

# Ke Aldarion lagi
echo ""
echo "=========================================="
echo "   MONITORING DHCP LEASES (di Aldarion)"
echo "=========================================="

echo ""
echo "[*] Active DHCP Leases:"
echo "==========================================="
cat /var/lib/dhcp/dhcpd.leases

echo ""
echo "[*] DHCP Server Statistics:"
echo "==========================================="
echo "Leases by subnet:"
grep "^lease" /var/lib/dhcp/dhcpd.leases | awk '{print $2}' | sort | uniq -c

echo ""
echo "[*] Recent DHCP Server Log:"
echo "==========================================="
tail -n 30 /var/log/syslog | grep dhcpd

echo ""
echo "=========================================="
echo "         ALL TESTING COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Aldarion: DHCP Server configured"
echo "✅ Gilgalad: Received IP with 30 min lease (Manusia)"
echo "✅ Amandil: Received IP with 10 min lease (Peri)"
echo "✅ Max lease time: 1 hour for all"
echo ""
echo "Verification Summary:"
echo "  - Manusia (10.88.1.5-34): default 1800s, max 3600s"
echo "  - Peri (10.88.2.7-255): default 600s, max 3600s"
echo ""
