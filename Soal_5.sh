# Amdir (DNS Slave)
apt-get update
apt-get install ifupdown -y
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

mkdir -p /etc/bind/K49

cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type slave;
    masters { 10.88.3.2; };
    file "/etc/bind/K49/jarkomK49.com";
};

zone "3.88.10.in-addr.arpa" {
    type slave;
    masters { 10.88.3.2; };       
    file "/etc/bind/K49/3.88.10.in-addr.arpa";
};
EOF

cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

chown -R bind:bind /etc/bind/K49
chmod 755 /etc/bind/K49
service bind9 restart
