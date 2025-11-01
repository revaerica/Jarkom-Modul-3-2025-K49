# Minastir

echo "=========================================="
echo "          MINASTIR DNS FORWARDER"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "[*] Testing connection..."
ping -c 3 deb.debian.org

echo "[*] Installing BIND9..."
apt-get update 
apt-get install bind9 bind9utils -y

echo "[*] Configuring BIND options..."
cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders { 192.168.122.1; };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
    listen-on { 127.0.0.1; 10.88.5.2; };
};
EOF

named-checkconf /etc/bind/named.conf.options

echo "[*] Configuring forward zone..."
cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type forward;
    forward only;
    forwarders { 10.88.3.2; 10.88.3.3; };
};
EOF

if ! grep -q 'include "/etc/bind/named.conf.local";' /etc/bind/named.conf; then
    echo 'include "/etc/bind/named.conf.local";' >> /etc/bind/named.conf
fi

echo "[*] Restarting BIND9..."
pkill named
sleep 2
/usr/sbin/named

ps aux | grep named

echo ""
echo "=========================================="
echo "   MINASTIR SETUP COMPLETE!"
echo "=========================================="
echo "Minastir akan forward query jarkomK49.com ke Erendis/Amdir"

# Erendis ( ns1 / master )
#!/bin/bash
echo "=========================================="
echo "            ERENDIS DNS MASTER"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "[*] Installing BIND9..."
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /etc/bind/K49

echo "[*] Configuring BIND options..."
cat > /etc/bind/named.conf.options <<EOF
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders { 10.88.5.2; };
    allow-query { any; };
    allow-recursion { 10.88.0.0/16; any; };
    listen-on { any; };
};
EOF

echo "[*] Configuring zone..."
cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };    
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/jarkomK49.com";
};
EOF

echo "[*] Creating zone file..."
cat > /etc/bind/K49/jarkomK49.com <<'EOF'
$TTL 604800
@       IN SOA jarkomK49.com. root.jarkomK49.com. (
            2025110115 ; Serial (UPDATED)
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL
;
@           IN NS ns1.jarkomK49.com.
@           IN NS ns2.jarkomK49.com.
@           IN A 10.88.3.2

; Name Servers
ns1         IN A 10.88.3.2
ns2         IN A 10.88.3.3

; Services (Load Balancers)
numenor-web IN A 10.88.2.2  ; FIXED: Pharazon (LB)
laravel-web IN A 10.88.1.35 ; Elros (LB)

; Hosts
Palantir    IN A 10.88.4.3
Elros       IN A 10.88.1.35
Pharazon    IN A 10.88.2.2  ; FIXED
Elendil     IN A 10.88.1.2
Isildur     IN A 10.88.1.3
Anarion     IN A 10.88.1.4
Galadriel   IN A 10.88.2.6  ; FIXED
Celeborn    IN A 10.88.2.5  ; FIXED
Oropher     IN A 10.88.2.4

; CNAME
www         IN CNAME numenor-web
EOF

chown -R bind:bind /etc/bind/K49/
chmod 644 /etc/bind/K49/*

echo "[*] Checking zone file..."
named-checkzone jarkomK49.com /etc/bind/K49/jarkomK49.com
named-checkconf

echo "[*] Restarting BIND9..."
pkill named
sleep 2
/usr/sbin/named

echo ""
echo "=========================================="
echo "   ERENDIS SETUP COMPLETE!"
echo "=========================================="

# Amdir (dns slave)
#!/bin/bash
echo "=========================================="
echo "            AMDIR DNS SLAVE"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "[*] Installing BIND9..."
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /var/cache/bind
chown bind:bind /var/cache/bind

echo "[*] Configuring BIND options..."
cat > /etc/bind/named.conf.options <<EOF
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders { 10.88.5.2; };
    allow-query { any; };
    allow-recursion { 10.88.0.0/16; any; };
    listen-on { any; };
};
EOF

echo "[*] Configuring slave zone..."
cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type slave;
    file "/var/cache/bind/jarkomK49.com";
    masters { 10.88.3.2; };
};
EOF

named-checkconf

echo "[*] Restarting BIND9..."
pkill named
sleep 2
/usr/sbin/named

echo "[*] Waiting for zone transfer..."
sleep 5

echo "[*] Checking zone transfer..."
ls -lh /var/cache/bind/

echo ""
echo "=========================================="
echo "         AMDIR SETUP COMPLETE!"
echo "=========================================="
echo "Zone file transferred:"
ls -lh /var/cache/bind/jarkomK49.com 2>/dev/null || echo "Zone transfer belum selesai"

# Di Amandil-Gilgalad
echo "=========================================="
echo "              CLIENT TESTING"
echo "=========================================="

echo "[*] Configuring DNS resolution..."
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
nameserver 10.88.5.2
EOF

echo ""
echo "=========================================="
echo "   TESTING DNS RESOLUTION"
echo "=========================================="

echo ""
echo "[*] Testing laravel-web.jarkomK49.com"
nslookup laravel-web.jarkomK49.com

echo ""
echo "[*] Testing numenor-web.jarkomK49.com"
nslookup numenor-web.jarkomK49.com

echo ""
echo "[*] Testing google.com (via Minastir forwarder)"
nslookup google.com

echo ""
echo "[*] Testing www.jarkomK49.com (CNAME)"
nslookup www.jarkomK49.com

echo ""
echo "[*] Testing all hosts"
echo "--- Name Servers ---"
nslookup ns1.jarkomK49.com
nslookup ns2.jarkomK49.com

echo ""
echo "--- Worker Hosts ---"
nslookup Palantir.jarkomK49.com
nslookup Elros.jarkomK49.com
nslookup Pharazon.jarkomK49.com
nslookup Elendil.jarkomK49.com
nslookup Isildur.jarkomK49.com
nslookup Anarion.jarkomK49.com
nslookup Galadriel.jarkomK49.com
nslookup Celeborn.jarkomK49.com
nslookup Oropher.jarkomK49.com

echo ""
echo "=========================================="
echo "             TESTING COMPLETE!"
echo "=========================================="
