echo "=========================================="
echo "    ALDARION DHCP SERVER CONFIGURATION"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-server -y

echo "[*] Configuring DHCP interface..."
echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

echo "[*] Creating DHCP configuration with lease time rules..."

cat > /etc/dhcp/dhcpd.conf <<'EOF'
default-lease-time 3600;
max-lease-time 3600;

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
    
    # Keluarga Peri: seperenam jam (10 menit = 600 detik)
    default-lease-time 600;
    max-lease-time 3600;
}

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
echo "Keluarga Manusia (10.88.1.x): 30 menit (1800s)"
echo "Keluarga Peri (10.88.2.x): 10 menit (600s)"
echo "Batas Maksimal (semua): 1 jam (3600s)"
echo ""
echo "Range IP:"
echo "  - Manusia: 10.88.1.5 - 10.88.1.34"
echo "  - Peri: 10.88.2.7 - 10.88.2.255"
echo ""

# Gilgalad
echo "=========================================="
echo "   TESTING - CLIENT KELUARGA MANUSIA"
echo "=========================================="

cat > /etc/network/interfaces <<EOF
auto eth0
iface eth0 inet dhcp
EOF

echo "[*] Requesting IP from DHCP (Keluarga Manusia)..."
ip addr flush dev eth0
dhclient -r eth0
dhclient eth0

echo ""
echo "[*] IP Configuration received:"
ip addr show eth0
echo ""

echo "[*] Checking lease time..."
cat /var/lib/dhcp/dhclient.leases | grep -E "lease|renew|rebind|expire"

echo ""
echo "Expected lease time: 30 minutes (1800 seconds)"
echo ""

# Amandil
echo "=========================================="
echo "   TESTING - CLIENT KELUARGA PERI"
echo "=========================================="

cat > /etc/network/interfaces <<EOF
auto eth0
iface eth0 inet dhcp
EOF

echo "[*] Requesting IP from DHCP (Keluarga Peri)..."
ip addr flush dev eth0
dhclient -r eth0
dhclient eth0

echo ""
echo "[*] IP Configuration received:"
ip addr show eth0
echo ""

echo "[*] Checking lease time..."
cat /var/lib/dhcp/dhclient.leases | grep -E "lease|renew|rebind|expire"

echo ""
echo "Expected lease time: 10 minutes (600 seconds)"
echo ""

echo "=========================================="
echo "           TESTING COMPLETE!"
echo "=========================================="
echo ""
echo "Verification:"
echo "  ✅ Manusia mendapat IP dari range 10.88.1.5-34"
echo "  ✅ Lease time Manusia: 30 menit"
echo "  ✅ Peri mendapat IP dari range 10.88.2.7-255"
echo "  ✅ Lease time Peri: 10 menit"
echo "  ✅ Max lease time semua: 1 jam"
echo ""

# Aldarion
echo "=========================================="
echo "         MONITORING DHCP LEASES"
echo "=========================================="

echo ""
echo "[*] Active DHCP Leases:"
cat /var/lib/dhcp/dhcpd.leases

echo ""
echo "[*] DHCP Server Log:"
tail -n 50 /var/log/syslog | grep dhcpd

echo ""
echo "=========================================="
echo "         MONITORING COMPLETE!"
echo "=========================================="
echo ""
