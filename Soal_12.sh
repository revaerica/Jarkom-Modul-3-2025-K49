# Galadriel
echo "=========================================="
echo "      GALADRIEL - PHP WORKER 1"
echo "=========================================="

echo "nameserver 10.88.5.2" > /etc/resolv.conf

apt-get update
apt-get install -y nginx php-fpm php-cli

service php7.4-fpm start 2>/dev/null || service php8.1-fpm start

mkdir -p /var/www/html
cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
echo "Hostname: $hostname\n";
?>
EOF

chown -R www-data:www-data /var/www/html

cat > /etc/nginx/sites-available/php-site <<'EOF'
server {
    listen 8004;
    server_name galadriel.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    }

    location / {
        try_files $uri $uri/ =404;
    }
}

# Block IP access
server {
    listen 8004 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/php-site /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t && service nginx restart

echo "✅ Galadriel ready at galadriel.jarkomK49.com:8004"

# Celeborn
echo "=========================================="
echo "      CELEBORN - PHP WORKER 2"
echo "=========================================="

echo "nameserver 10.88.5.2" > /etc/resolv.conf

apt-get update
apt-get install -y nginx php-fpm php-cli

service php7.4-fpm start 2>/dev/null || service php8.1-fpm start

mkdir -p /var/www/html
cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
echo "Hostname: $hostname\n";
?>
EOF

chown -R www-data:www-data /var/www/html

cat > /etc/nginx/sites-available/php-site <<'EOF'
server {
    listen 8005;
    server_name celeborn.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    }

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 8005 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/php-site /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t && service nginx restart

echo "✅ Celeborn ready at celeborn.jarkomK49.com:8005"

# Oropher
echo "=========================================="
echo "      OROPHER - PHP WORKER 3"
echo "=========================================="

echo "nameserver 10.88.5.2" > /etc/resolv.conf

apt-get update
apt-get install -y nginx php-fpm php-cli

service php7.4-fpm start 2>/dev/null || service php8.1-fpm start

mkdir -p /var/www/html
cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
echo "Hostname: $hostname\n";
?>
EOF

chown -R www-data:www-data /var/www/html

cat > /etc/nginx/sites-available/php-site <<'EOF'
server {
    listen 8006;
    server_name oropher.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    }

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 8006 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/php-site /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t && service nginx restart

echo "✅ Oropher ready at oropher.jarkomK49.com:8006"

# Di Client (Gilgalad / Amandil)
echo "=========================================="
echo "           TESTING PHP WORKERS"
echo "=========================================="
cat > /etc/resolv.conf <<EOF
nameserver 10.88.5.2
EOF

apt-get update
apt-get install -y lynx curl

echo ""
echo "=== Testing Galadriel ==="
lynx -dump http://galadriel.jarkomK49.com:8004 || echo "Test Galadriel manual pakai curl"

echo ""
echo "=== Testing Celeborn ==="
lynx -dump http://celeborn.jarkomK49.com:8005 || echo "Test Celeborn manual pakai curl"

echo ""
echo "=== Testing Oropher ==="
lynx -dump http://oropher.jarkomK49.com:8006 || echo "Test Oropher manual pakai curl"

echo ""
echo "=========================================="
echo "                 COMPLETE!"
echo "=========================================="
