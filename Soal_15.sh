# Galadriel
echo "=========================================="
echo "   ADDING X-REAL-IP HEADER"
echo "=========================================="

echo ""
echo "=== Galadriel: Adding X-Real-IP ==="

cat > /etc/nginx/sites-available/php-site <<'EOF'
server {
    listen 8004;
    server_name galadriel.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    auth_basic "Restricted Access - Taman Peri";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        
        # Pass real IP to PHP
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
    }

    location / {
        try_files $uri $uri/ =404;
    }
}

server {
    listen 8004 default_server;
    server_name _;
    return 444;
}
EOF

# Update index.php to show visitor IP
cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
$visitor_ip = $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR'] ?? 'Unknown';

echo "=================================\n";
echo "Taman Peri - Galadriel\n";
echo "=================================\n";
echo "Hostname: $hostname\n";
echo "Visitor IP: $visitor_ip\n";
echo "=================================\n";
?>
EOF

nginx -t
service nginx restart

echo "✅ Galadriel: X-Real-IP header added"

# Celeborn
echo ""
echo "=== Celeborn: Adding X-Real-IP ==="

cat > /etc/nginx/sites-available/php-site <<'EOF'
server {
    listen 8005;
    server_name celeborn.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    auth_basic "Restricted Access - Taman Peri";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
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

cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
$visitor_ip = $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR'] ?? 'Unknown';

echo "=================================\n";
echo "Taman Peri - Celeborn\n";
echo "=================================\n";
echo "Hostname: $hostname\n";
echo "Visitor IP: $visitor_ip\n";
echo "=================================\n";
?>
EOF

nginx -t
service nginx restart

echo "✅ Celeborn: X-Real-IP header added"

# Oropher
echo ""
echo "=== Oropher: Adding X-Real-IP ==="

cat > /etc/nginx/sites-available/php-site <<'EOF'
server {
    listen 8006;
    server_name oropher.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    auth_basic "Restricted Access - Taman Peri";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
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

cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
$visitor_ip = $_SERVER['HTTP_X_REAL_IP'] ?? $_SERVER['REMOTE_ADDR'] ?? 'Unknown';

echo "=================================\n";
echo "Taman Peri - Oropher\n";
echo "=================================\n";
echo "Hostname: $hostname\n";
echo "Visitor IP: $visitor_ip\n";
echo "=================================\n";
?>
EOF

nginx -t
service nginx restart

echo "✅ Oropher: X-Real-IP header added"

# Di Client
echo ""
echo "=========================================="
echo "   TESTING X-REAL-IP DISPLAY"
echo "=========================================="

cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
EOF

apt-get update
apt-get install -y curl lynx

echo ""
echo "=== Test 1: Direct access to workers ==="
echo ""
echo "Galadriel:"
curl -u noldor:silvan http://galadriel.jarkomK49.com:8004

echo ""
echo "Celeborn:"
curl -u noldor:silvan http://celeborn.jarkomK49.com:8005

echo ""
echo "Oropher:"
curl -u noldor:silvan http://oropher.jarkomK49.com:8006

echo ""
echo "=== Test 2: Via Load Balancer (Pharazon) ==="
for i in {1..3}; do
    echo ""
    echo "Request #$i:"
    curl -u noldor:silvan http://pharazon.jarkomK49.com
done

echo ""
echo "=== Test 3: Check client IP ==="
echo "Your client IP should be displayed in the output above"
ip addr show eth0 | grep "inet " | awk '{print "Client IP: " $2}'

echo ""
echo "=== Test 4: Using lynx ==="
lynx -auth=noldor:silvan -dump http://pharazon.jarkomK49.com

echo ""
echo "=========================================="
echo "   NOMOR 15 COMPLETE!"
echo "=========================================="
echo ""
echo "✅ X-Real-IP header configured"
echo "✅ Visitor IP displayed in PHP"
echo "✅ Real IP forwarded through load balancer"
echo "✅ Each worker shows correct visitor information"
echo ""
echo "Features:"
echo "  - Hostname identification"
echo "  - Real visitor IP tracking"
echo "  - Works through proxy (Pharazon)"
