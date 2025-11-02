# Galadriel
echo "=========================================="
echo "   ADDING BASIC HTTP AUTHENTICATION"
echo "=========================================="

echo ""
echo "=== Galadriel: Adding Authentication ==="

apt-get update
apt-get install -y apache2-utils

# user: noldor, pass: silvan
htpasswd -bc /etc/nginx/.htpasswd noldor silvan

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

nginx -t
service nginx restart

echo "✅ Galadriel: Authentication enabled (noldor/silvan)"

# Celeborn
echo ""
echo "=== Celeborn: Adding Authentication ==="

apt-get update
apt-get install -y apache2-utils
htpasswd -bc /etc/nginx/.htpasswd noldor silvan

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

nginx -t
service nginx restart

echo "✅ Celeborn: Authentication enabled (noldor/silvan)"

# Oropher
echo ""
echo "=== Oropher: Adding Authentication ==="

apt-get update
apt-get install -y apache2-utils
htpasswd -bc /etc/nginx/.htpasswd noldor silvan

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

nginx -t
service nginx restart

echo "✅ Oropher: Authentication enabled (noldor/silvan)"

# Pharazon
echo ""
echo "=== Pharazon: Update to pass auth headers ==="

cat > /etc/nginx/sites-available/php-load-balancer <<'EOF'
upstream taman_peri {
    server 10.88.2.6:8004; # Galadriel
    server 10.88.2.5:8005; # Celeborn
    server 10.88.2.4:8006; # Oropher
}

server {
    listen 80;
    server_name pharazon.jarkomK49.com;

    location / {
        proxy_pass http://taman_peri;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # Pass authentication headers
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;
    }

    access_log /var/log/nginx/pharazon_access.log;
    error_log /var/log/nginx/pharazon_error.log;
}

server {
    listen 80 default_server;
    server_name _;
    return 444;
}
EOF

nginx -t
service nginx restart

echo "✅ Pharazon: Updated to pass authentication"

# Testing di Client
echo ""
echo "=========================================="
echo "   TESTING AUTHENTICATION"
echo "=========================================="

# Di Client
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
EOF

apt-get update
apt-get install -y lynx curl

echo ""
echo "=== Test 1: Without credentials (should fail) ==="
curl http://galadriel.jarkomK49.com:8004

echo ""
echo "=== Test 2: With credentials (should work) ==="
curl -u noldor:silvan http://galadriel.jarkomK49.com:8004

echo ""
echo "=== Test 3: Via Load Balancer with auth ==="
for i in {1..3}; do
    echo "Request #$i:"
    curl -u noldor:silvan http://pharazon.jarkomK49.com
    echo ""
done

echo ""
echo "=== Test 4: Using lynx ==="
lynx -auth=noldor:silvan -dump http://pharazon.jarkomK49.com

echo ""
echo "=========================================="
echo "   NOMOR 14 COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Basic Auth enabled on all workers"
echo "✅ Credentials: noldor/silvan"
echo "✅ Authentication passed through load balancer"
echo "✅ Unauthorized access blocked"
