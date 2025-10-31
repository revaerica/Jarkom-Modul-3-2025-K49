# Minastir
echo "nameserver 192.168.122.1" > /etc/resolv.conf

ping -c 3 deb.debian.org

apt-get update 
apt-get install bind9 bind9utils -y

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

cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type forward;
    forward only;
    forwarders { 10.88.3.2; 10.88.3.3; };
};
EOF

echo 'include "/etc/bind/named.conf.local";' >> /etc/bind/named.conf

pkill named
/usr/sbin/named

ps aux | grep named

# Erendis ( ns1 / master )
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y
mkdir -p /etc/bind/K49

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
# named.conf.local
cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };    
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/jarkomK49.com";
};
EOF

cat > /etc/bind/K49/jarkomK49.com <<'EOF'
$TTL 604800
@       IN SOA jarkomK49.com. root.jarkomK49.com. (
            2025110103 ; Serial
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL

@           IN NS ns1.jarkomK49.com.
@           IN NS ns2.jarkomK49.com.
@           IN A 10.88.3.2

ns1         IN A 10.88.3.2
ns2         IN A 10.88.3.3

numenor-web IN A 10.88.2.6 
laravel-web IN A 10.88.1.35

Palantir    IN A 10.88.4.3
Pharazon    IN A 10.88.2.6
Elros       IN A 10.88.1.35
Elendil     IN A 10.88.1.2
Isildur     IN A 10.88.1.3
Anarion     IN A 10.88.1.4
Galadriel   IN A 10.88.2.2
Celeborn    IN A 10.88.2.3
Oropher     IN A 10.88.2.4

www           IN CNAME numenor-web
EOF

pkill named
/usr/sbin/named

# Amdir (dns slave)
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y

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

cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type slave;
    file "jarkomK49.com";
    masters { 10.88.3.2; };
};
EOF

pkill named
/usr/sbin/named

# Di Gilgalad atau Amandil
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
nameserver 10.88.5.2
EOF

nslookup laravel-web.jarkomK49.com
nslookup numenor-web.jarkomK49.com
nslookup google.com
