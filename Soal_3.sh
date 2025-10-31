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
};
EOF

service bind9 restart
