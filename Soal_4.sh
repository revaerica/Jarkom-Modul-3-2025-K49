# Erendis
sed -i 's/^numenor-web\tIN\tA\t10.88.2\.[0-9]\+/numenor-web\tIN\tA\t10.88.2.2/' /etc/bind/K49/jarkomK49.com
sed -i '/IN\tPTR\tPharazon/d' /etc/bind/K49/2.88.10.in-addr.arpa
sed -i '/IN\tPTR\tGaladriel/d' /etc/bind/K49/2.88.10.in-addr.arpa

sed -i '/@\s\+IN\s\+NS\s\+ns2/a\2\t\tIN\tPTR\tPharazon.jarkomK49.com.' /etc/bind/K49/2.88.10.in-addr.arpa
sed -i '/@\s\+IN\s\+NS\s\+ns2/a\6\t\tIN\tPTR\tGaladriel.jarkomK49.com.' /etc/bind/K49/2.88.10.in-addr.arpa

named-checkzone jarkomK49.com /etc/bind/K49/jarkomK49.com 
named-checkzone 2.88.10.in-addr.arpa /etc/bind/K49/2.88.10.in-addr.arpa 

pkill named
/usr/sbin/named

cat > /etc/bind/K49/1.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. ( 2025110108 ; Serial
                                  604800 ; Refresh
                                  86400 ; Retry
                                  2419200 ; Expire
                                  604800 ) ; Negative Cache TTL
@       IN NS ns1.jarkomK49.com.
@       IN NS ns2.jarkomK49.com.
35      IN PTR Elros.jarkomK49.com.
2       IN PTR Elendil.jarkomK49.com.
3       IN PTR Isildur.jarkomK49.com.
4       IN PTR Anarion.jarkomK49.com.
EOF

cat > /etc/bind/K49/2.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. ( 2025110110 ; Serial (Tingkatkan Serial)
                                     604800 ; Refresh
                                     86400 ; Retry
                                     2419200 ; Expire
                                     604800 ) ; Negative Cache TTL
@       IN NS ns1.jarkomK49.com.
@       IN NS ns2.jarkomK49.com.
2       IN PTR Pharazon.jarkomK49.com.    # PHARAZON BARU
6       IN PTR Galadriel.jarkomK49.com.   # GALADRIEL BARU
5       IN PTR Celeborn.jarkomK49.com.
4       IN PTR Oropher.jarkomK49.com.
EOF

cat > /etc/bind/K49/3.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. ( 2025110108 ; Serial
                                  604800 ; Refresh
                                  86400 ; Retry
                                  2419200 ; Expire
                                  604800 ) ; Negative Cache TTL
@       IN NS ns1.jarkomK49.com.
@       IN NS ns2.jarkomK49.com.
2       IN PTR ns1.jarkomK49.com.
3       IN PTR ns2.jarkomK49.com.
EOF

cat > /etc/bind/K49/4.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@       IN SOA ns1.jarkomK49.com. root.jarkomK49.com. ( 2025110108 ; Serial
                                  604800 ; Refresh
                                  86400 ; Retry
                                  2419200 ; Expire
                                  604800 ) ; Negative Cache TTL
@       IN NS ns1.jarkomK49.com.
@       IN NS ns2.jarkomK49.com.
3       IN PTR Palantir.jarkomK49.com.
EOF

named-checkzone jarkomK49.com /etc/bind/K49/jarkomK49.com
named-checkzone 1.88.10.in-addr.arpa /etc/bind/K49/1.88.10.in-addr.arpa
named-checkzone 2.88.10.in-addr.arpa /etc/bind/K49/2.88.10.in-addr.arpa
named-checkzone 3.88.10.in-addr.arpa /etc/bind/K49/3.88.10.in-addr.arpa
named-checkzone 4.88.10.in-addr.arpa /etc/bind/K49/4.88.10.in-addr.arpa

pkill named
/usr/sbin/named

# Di Amdir 
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install bind9 bind9-dnsutils -y
service bind9 restart

which named
pkill named
/usr/sbin/named

# Elros
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2  # Erendis
nameserver 10.88.3.3  # Amdir
nameserver 192.168.122.1
EOF
apt-get update
apt-get install -y systemd
apt-get install nginx -y

cat > /etc/nginx/sites-available/laravel-web <<EOF
upstream laravel_workers {
    server 10.88.1.2;  # Elendil
    server 10.88.1.3;  # Isildur
    server 10.88.1.4;  # Anarion
}

server {
    listen 80;
    server_name laravel-web.jarkomK49.com;

    location / {
        proxy_pass http://laravel_workers;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

ln -s /etc/nginx/sites-available/laravel-web /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

service nginx restart

service nginx status

# Pharazon
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2  # Erendis
nameserver 10.88.3.3  # Amdir
nameserver 192.168.122.1
EOF
apt-get update && apt-get install nginx -y

cat > /etc/nginx/sites-available/numenor-web <<'EOF'
upstream php_workers {
    server 10.88.2.6 max_fails=3 fail_timeout=3s;
    server 10.88.2.5 max_fails=3 fail_timeout=3s;
    server 10.88.2.4 max_fails=3 fail_timeout=3s;
}

server {
    listen 80;
    server_name numenor-web.jarkomK49.com www.jarkomK49.com;

    # Matikan keepalive ke klien
    keepalive_timeout 0;
    
    location / {
        proxy_pass http://php_workers;
        
        proxy_http_version 1.1;
        proxy_set_header Connection "close"; 

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
EOF

ln -s /etc/nginx/sites-available/numenor-web /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service nginx restart
service nginx status

# Elendil, Isildur, Anarion
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install nginx php8.4-fpm php8.4-curl php8.4-mbstring php8.4-xml php8.4-mysql git -y
apt-get install -y composer

cd /var/www/
git clone https://github.com/elshiraphine/laravel-simple-rest-api laravel-web
chown -R www-data:www-data /var/www/laravel-web/

cd /var/www/laravel-web/
chown -R www-data:www-data .
rm composer.lock

composer install --no-dev
cp .env.example .env
php artisan key:generate

php artisan migrate --force
php artisan cache:clear
php artisan config:clear

chown -R www-data:www-data /var/www/laravel-web/storage
chown -R www-data:www-data /var/www/laravel-web/bootstrap/cache

cat > /etc/nginx/sites-available/laravel-web <<EOF
server {
    listen 80 default_server;
    root /var/www/laravel-web/public;
    index index.php;
    server_name _;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock; 
    }
}
EOF

ln -s /etc/nginx/sites-available/laravel-web /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

chown -R www-data:www-data /var/www/laravel-web/storage
chown -R www-data:www-data /var/www/laravel-web/bootstrap/cache

service php8.4-fpm restart
service nginx restart

service php8.4-fpm status
service nginx status

# Di Galadriel, Celeborn, dan Oropher
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install nginx php8.4-fpm php8.4-curl php8.4-mbstring php8.4-xml php8.4-mysql git -y

cat > /etc/nginx/sites-available/numenor-web <<'EOF'
server {
    listen 80 default_server;
    root /var/www/numenor-web/;
    index index.php index.html;
    server_name _;

    client_header_buffer_size 128k;
    large_client_header_buffers 4 128k;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }
}
EOF

ln -s /etc/nginx/sites-available/numenor-web /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default # Hapus default

HOST_IP=$(hostname -I | awk '{print $1}')
HOST_NAME=$(hostname)
mkdir -p /var/www/numenor-web/
echo '<?php echo "Halo dari Worker: " . gethostname() . " (" . gethostbyname(gethostname()) . ")"; ?>' > /var/www/numenor-web/index.php

chown -R www-data:www-data /var/www/numenor-web/
chown -R www-data:www-data /var/www/html/

service php8.4-fpm restart
nginx -t
service nginx restart

# Gilgalad atau Amandil
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3 
nameserver 10.88.5.2
nameserver 192.168.122.1
EOF

curl numenor-web.jarkomK49.com
curl laravel-web.jarkomK49.com/api/item
