# Node: Erendis (10.88.3.2)
echo "=========================================="
echo "       ERENDIS REVERSE DNS MASTER"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /etc/bind/K49

echo "[*] Creating reverse zone files..."

cat > /etc/bind/K49/1.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110115 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL
;
@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

; PTR Records untuk subnet 10.88.1.x
35      IN      PTR     Elros.jarkomK49.com.
2       IN      PTR     Elendil.jarkomK49.com.
3       IN      PTR     Isildur.jarkomK49.com.
4       IN      PTR     Anarion.jarkomK49.com.
EOF

cat > /etc/bind/K49/2.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110115 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL
;
@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

; PTR Records untuk subnet 10.88.2.x
2       IN      PTR     Pharazon.jarkomK49.com.
6       IN      PTR     Galadriel.jarkomK49.com.
5       IN      PTR     Celeborn.jarkomK49.com.
4       IN      PTR     Oropher.jarkomK49.com.
EOF

cat > /etc/bind/K49/3.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110115 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL
;
@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

; PTR Records untuk subnet 10.88.3.x
2       IN      PTR     ns1.jarkomK49.com.
3       IN      PTR     ns2.jarkomK49.com.
EOF

cat > /etc/bind/K49/4.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110115 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL
;
@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

; PTR Records untuk subnet 10.88.4.x
3       IN      PTR     Palantir.jarkomK49.com.
EOF

echo "[*] Updating named.conf.local with reverse zones..."

cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };    
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/jarkomK49.com";
};

zone "1.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/1.88.10.in-addr.arpa";
};

zone "2.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/2.88.10.in-addr.arpa";
};

zone "3.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/3.88.10.in-addr.arpa";
};

zone "4.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/4.88.10.in-addr.arpa";
};
EOF

chown -R bind:bind /etc/bind/K49/
chmod 644 /etc/bind/K49/*

echo "[*] Checking reverse zone files..."
named-checkzone 1.88.10.in-addr.arpa /etc/bind/K49/1.88.10.in-addr.arpa
named-checkzone 2.88.10.in-addr.arpa /etc/bind/K49/2.88.10.in-addr.arpa
named-checkzone 3.88.10.in-addr.arpa /etc/bind/K49/3.88.10.in-addr.arpa
named-checkzone 4.88.10.in-addr.arpa /etc/bind/K49/4.88.10.in-addr.arpa

echo "[*] Checking configuration..."
named-checkconf

echo "[*] Restarting BIND9..."
pkill named
sleep 2
/usr/sbin/named

echo ""
echo "=========================================="
echo "            ERENDIS COMPLETE!"
echo "=========================================="
echo ""
echo "Reverse zones created for:"
echo "  - 10.88.1.x (1.88.10.in-addr.arpa)"
echo "  - 10.88.2.x (2.88.10.in-addr.arpa)"
echo "  - 10.88.3.x (3.88.10.in-addr.arpa)"
echo "  - 10.88.4.x (4.88.10.in-addr.arpa)"

# Di Amdir 
echo "=========================================="
echo "         AMDIR REVERSE DNS SLAVE"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /var/cache/bind
chown bind:bind /var/cache/bind

echo "[*] Configuring slave for all zones (forward + reverse)..."

cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type slave;
    file "/var/cache/bind/jarkomK49.com";
    masters { 10.88.3.2; };
};

zone "1.88.10.in-addr.arpa" {
    type slave;
    file "/var/cache/bind/1.88.10.in-addr.arpa";
    masters { 10.88.3.2; };
};

zone "2.88.10.in-addr.arpa" {
    type slave;
    file "/var/cache/bind/2.88.10.in-addr.arpa";
    masters { 10.88.3.2; };
};

zone "3.88.10.in-addr.arpa" {
    type slave;
    file "/var/cache/bind/3.88.10.in-addr.arpa";
    masters { 10.88.3.2; };
};

zone "4.88.10.in-addr.arpa" {
    type slave;
    file "/var/cache/bind/4.88.10.in-addr.arpa";
    masters { 10.88.3.2; };
};
EOF

echo "[*] Checking configuration..."
named-checkconf

echo "[*] Restarting BIND9..."
pkill named
sleep 2
/usr/sbin/named

echo "[*] Waiting for zone transfer from Master..."
sleep 5

echo "[*] Checking transferred zones..."
ls -lh /var/cache/bind/

echo ""
echo "=========================================="
echo "            AMDIR COMPLETE!"
echo "=========================================="
echo ""
echo "Transferred zones:"
ls -lh /var/cache/bind/*.arpa 2>/dev/null || echo "Waiting for zone transfer..."

# Gilgalad atau Amandil
echo "=========================================="
echo "         REVERSE DNS TESTING"
echo "=========================================="

cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
nameserver 10.88.5.2
EOF

echo ""
echo "=========================================="
echo "   TESTING REVERSE LOOKUP (IP → Hostname)"
echo "=========================================="

echo ""
echo "[*] Subnet 10.88.1.x (Laravel Workers + LB)"
echo "--------------------------------------------"
echo "Testing 10.88.1.35 → Elros:"
nslookup 10.88.1.35
echo ""
echo "Testing 10.88.1.2 → Elendil:"
nslookup 10.88.1.2
echo ""
echo "Testing 10.88.1.3 → Isildur:"
nslookup 10.88.1.3
echo ""
echo "Testing 10.88.1.4 → Anarion:"
nslookup 10.88.1.4

echo ""
echo "[*] Subnet 10.88.2.x (PHP Workers + LB)"
echo "--------------------------------------------"
echo "Testing 10.88.2.2 → Pharazon:"
nslookup 10.88.2.2
echo ""
echo "Testing 10.88.2.6 → Galadriel:"
nslookup 10.88.2.6
echo ""
echo "Testing 10.88.2.5 → Celeborn:"
nslookup 10.88.2.5
echo ""
echo "Testing 10.88.2.4 → Oropher:"
nslookup 10.88.2.4

echo ""
echo "[*] Subnet 10.88.3.x (DNS Servers)"
echo "--------------------------------------------"
echo "Testing 10.88.3.2 → ns1 (Erendis):"
nslookup 10.88.3.2
echo ""
echo "Testing 10.88.3.3 → ns2 (Amdir):"
nslookup 10.88.3.3

echo ""
echo "[*] Subnet 10.88.4.x (Database)"
echo "--------------------------------------------"
echo "Testing 10.88.4.3 → Palantir:"
nslookup 10.88.4.3

echo ""
echo "=========================================="
echo "   TESTING FORWARD LOOKUP (Verifikasi)"
echo "=========================================="

echo ""
echo "Testing Elros.jarkomK49.com → 10.88.1.35:"
nslookup Elros.jarkomK49.com

echo ""
echo "Testing Pharazon.jarkomK49.com → 10.88.2.2:"
nslookup Pharazon.jarkomK49.com

echo ""
echo "Testing Galadriel.jarkomK49.com → 10.88.2.6:"
nslookup Galadriel.jarkomK49.com

echo ""
echo "Testing ns1.jarkomK49.com → 10.88.3.2:"
nslookup ns1.jarkomK49.com

echo ""
echo "Testing Palantir.jarkomK49.com → 10.88.4.3:"
nslookup Palantir.jarkomK49.com

echo ""
echo "=========================================="
echo "           TESTING COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Forward Lookup: hostname → IP (sudah jalan dari no 3)"
echo "✅ Reverse Lookup: IP → hostname (baru ditambahkan no 4)"
