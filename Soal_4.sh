# Erendis ( ns1 / master )
cat > /etc/bind/named.conf.local <<'EOF'
zone "K49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };      // IP Amdir (ns2)
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/K49.com";
};

zone "3.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };       // IP Valmar (ns2)
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/3.88.10.in-addr.arpa";
};
EOF

cat > /etc/bind/K49/K49.com <<'EOF'
$TTL 604800
@       IN SOA jarkomK49.com. root.K49.com. (
            2025101302 ; Serial YYYYMMDDXX
            604800     ; Refresh 1 minggu
            86400      ; Retry 1 hari
            2419200    ; Expire 4 minggu
            604800 )   ; Negative Cache TTL

@         IN NS ns1.jarkomK49.com.
@         IN NS ns2.jarkomK49.com.
@         IN A 10.88.3.2

ns1       IN A 10.88.3.2
ns2       IN A 10.88.3.3
Palantir  IN A 10.88.4.3
Elros     IN A 10.88.1.35
Pharazon  IN A 10.88.2.6
Elendil   IN A 10.88.1.2
Isildur   IN A 10.88.1.3
Anarion   IN A 10.88.1.4
Galadriel IN A 10.88.2.2
Celeborn  IN A 10.88.2.3
Oropher   IN A 10.88.2.4

www       IN CNAME jarkomK49.com.

Elros     IN TXT "Cincin Sauron"
Pharazon  IN TXT "Aliansi Terakhir"
EOF

cat > /etc/bind/K49/3.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN      SOA     ns1.jarkomK49.com. root.jarkomK49.com. (
                        2025101303 ; Serial YYYYMMDDXX (Serial dinaikkan)
                        604800     ; Refresh
                        86400      ; Retry
                        2419200    ; Expire
                        604800 )   ; Negative Cache TTL

@       IN      NS      ns1.jarkomK49.com.
@       IN      NS      ns2.jarkomK49.com.

2       IN      PTR     ns1.jarkomK49.com.
3       IN      PTR     ns2.jarkomK49.com.
EOF

cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF

service bind9 restart
