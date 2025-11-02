apt-get update && apt-get install bind9 bind9utils -y
ln -s /etc/init.d/named /etc/init.d/bind9

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
cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type forward;
    forward only;
    forwarders { 10.88.3.2; 10.88.3.3; };
};
EOF
service bind9 restart
