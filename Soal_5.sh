# Erendis
echo "=========================================="
echo "       ERENDIS DNS MASTER CONFIG"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /etc/bind/K49

echo "[*] Creating main forward zone with WWW alias and TXT records..."

cat > /etc/bind/K49/jarkomK49.com <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110116 ; Serial (updated)
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

ns1     IN      A       10.88.3.2
ns2     IN      A       10.88.3.3

@       IN      A       10.88.1.35
www     IN      CNAME   @

Elros       IN      A       10.88.1.35
www.Elros   IN      CNAME   Elros.jarkomK49.com.
Elendil     IN      A       10.88.1.2
www.Elendil IN      CNAME   Elendil.jarkomK49.com.
Isildur     IN      A       10.88.1.3
www.Isildur IN      CNAME   Isildur.jarkomK49.com.
Anarion     IN      A       10.88.1.4
www.Anarion IN      CNAME   Anarion.jarkomK49.com.

Pharazon    IN      A       10.88.2.2
www.Pharazon IN     CNAME   Pharazon.jarkomK49.com.
Galadriel   IN      A       10.88.2.6
www.Galadriel IN    CNAME   Galadriel.jarkomK49.com.
Celeborn    IN      A       10.88.2.5
www.Celeborn IN     CNAME   Celeborn.jarkomK49.com.
Oropher     IN      A       10.88.2.4
www.Oropher IN      CNAME   Oropher.jarkomK49.com.

Palantir    IN      A       10.88.4.3
www.Palantir IN     CNAME   Palantir.jarkomK49.com.

Elros       IN      TXT     "Cincin Sauron"
Pharazon    IN      TXT     "Aliansi Terakhir"
EOF

echo "[*] Creating reverse zone files..."

cat > /etc/bind/K49/1.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110116 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

35      IN      PTR     Elros.jarkomK49.com.
2       IN      PTR     Elendil.jarkomK49.com.
3       IN      PTR     Isildur.jarkomK49.com.
4       IN      PTR     Anarion.jarkomK49.com.
EOF

cat > /etc/bind/K49/2.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110116 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

2       IN      PTR     Pharazon.jarkomK49.com.
6       IN      PTR     Galadriel.jarkomK49.com.
5       IN      PTR     Celeborn.jarkomK49.com.
4       IN      PTR     Oropher.jarkomK49.com.
EOF

cat > /etc/bind/K49/3.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110116 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

2       IN      PTR     ns1.jarkomK49.com.
3       IN      PTR     ns2.jarkomK49.com.
EOF

cat > /etc/bind/K49/4.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
                              2025110116 ; Serial
                              604800     ; Refresh
                              86400      ; Retry
                              2419200    ; Expire
                              604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

3       IN      PTR     Palantir.jarkomK49.com.
EOF

echo "[*] Updating named.conf.local with all zones..."

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

echo "[*] Checking zone files..."
named-checkzone jarkomK49.com /etc/bind/K49/jarkomK49.com
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
echo "✅ WWW Alias untuk semua domain"
echo "✅ TXT Record: Elros → 'Cincin Sauron'"
echo "✅ TXT Record: Pharazon → 'Aliansi Terakhir'"
echo "✅ Reverse DNS untuk semua subnet"
echo ""

# Amdir
echo "=========================================="
echo "         AMDIR DNS SLAVE CONFIG"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /var/cache/bind
chown bind:bind /var/cache/bind

echo "[*] Configuring slave for all zones..."

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

echo "[*] Waiting for zone transfer..."
sleep 5

echo "[*] Checking transferred zones..."
ls -lh /var/cache/bind/

echo ""
echo "=========================================="
echo "            AMDIR COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Semua zone ditransfer dari Master"
echo "✅ Termasuk TXT records pesan rahasia"
echo ""

# Gilgalad atau Amandil
echo "=========================================="
echo "                DNS TESTING"
echo "=========================================="

cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
EOF

echo ""
echo "=========================================="
echo "   TEST 1: WWW ALIAS (CNAME Records)"
echo "=========================================="

echo ""
echo "[*] Testing www alias untuk domain utama:"
echo "--------------------------------------------"
nslookup www.jarkomK49.com
echo ""
nslookup www.Elros.jarkomK49.com
echo ""
nslookup www.Pharazon.jarkomK49.com
echo ""
nslookup www.Galadriel.jarkomK49.com
echo ""
nslookup www.Palantir.jarkomK49.com

echo ""
echo "=========================================="
echo "   TEST 2: TXT RECORDS (Pesan Rahasia)"
echo "=========================================="

echo ""
echo "[*] Testing TXT record untuk Elros (Cincin Sauron):"
echo "--------------------------------------------"
nslookup -type=TXT Elros.jarkomK49.com
dig TXT Elros.jarkomK49.com +short

echo ""
echo "[*] Testing TXT record untuk Pharazon (Aliansi Terakhir):"
echo "--------------------------------------------"
nslookup -type=TXT Pharazon.jarkomK49.com
dig TXT Pharazon.jarkomK49.com +short

echo ""
echo "=========================================="
echo "   TEST 3: REVERSE DNS (PTR Records)"
echo "=========================================="

echo ""
echo "[*] Testing reverse lookup key locations:"
echo "--------------------------------------------"
echo "Elros (10.88.1.35) - pembawa Cincin Sauron:"
nslookup 10.88.1.35
echo ""
echo "Pharazon (10.88.2.2) - pemimpin Aliansi Terakhir:"
nslookup 10.88.2.2
echo ""
echo "Erendis (10.88.3.2) - DNS Master:"
nslookup 10.88.3.2
echo ""
echo "Amdir (10.88.3.3) - DNS Slave:"
nslookup 10.88.3.3

echo ""
echo "=========================================="
echo "   TEST 4: FORWARD LOOKUP (Verifikasi)"
echo "=========================================="

echo ""
echo "[*] Testing forward lookup semua host:"
echo "--------------------------------------------"
nslookup Elros.jarkomK49.com
nslookup Pharazon.jarkomK49.com
nslookup ns1.jarkomK49.com
nslookup ns2.jarkomK49.com

echo ""
echo "=========================================="
echo "           ALL TESTS COMPLETE!"
echo "=========================================="
echo ""
echo "✅ WWW Alias: Semua subdomain dapat diakses via www"
echo "✅ TXT Records: Pesan rahasia tersimpan di Elros & Pharazon"
echo "✅ Reverse DNS: Dapat melacak lokasi dari IP address"
echo "✅ Master-Slave: Amdir memiliki semua informasi dari Erendis"
echo ""
echo "Pesan Rahasia yang Tersimpan:"
echo "Elros (10.88.1.35): 'Cincin Sauron'"
echo "Pharazon (10.88.2.2): 'Aliansi Terakhir'"
echo ""
