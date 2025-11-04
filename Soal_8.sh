# Palantir
echo "=========================================="
echo "       [PALANTIR] - MySQL Database"
echo "=========================================="

apt update -y
apt install -y mariadb-server

systemctl enable mariadb
systemctl start mariadb

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS laravel;
CREATE USER IF NOT EXISTS 'k49'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON laravel.* TO 'k49'@'%';
FLUSH PRIVILEGES;
EOF

sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb restart

echo ""
echo "✅ [PALANTIR] Database siap di 10.88.4.3 (user: k49, pass: 123456)"
echo ""

# Elendil
echo "=========================================="
echo "     [ELENDIL] - Database & Port Config"
echo "=========================================="

cd /var/www/laravel

cat > .env <<'EOF'
APP_NAME=Laravel
APP_ENV=production
APP_KEY=
APP_DEBUG=false
APP_URL=http://elendil.laravel.com

DB_CONNECTION=mysql
DB_HOST=10.88.4.3
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=k49
DB_PASSWORD=123456

LOG_CHANNEL=stack
LOG_LEVEL=debug
EOF

php artisan key:generate

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 8001;
    server_name elendil.laravel.com;
    root /var/www/laravel/public;

    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}

server {
    listen 8001 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
nginx -t && service nginx restart

php artisan migrate:fresh --seed

echo ""
echo "✅ [ELENDIL] Laravel terhubung ke Palantir"
echo "✅ Port: 8001"
echo ""

# Isildur
echo "=========================================="
echo "     [ISILDUR] - Database & Port Config"
echo "=========================================="

cd /var/www/laravel

cat > .env <<'EOF'
APP_NAME=Laravel
APP_ENV=production
APP_KEY=
APP_DEBUG=false
APP_URL=http://isildur.laravel.com

DB_CONNECTION=mysql
DB_HOST=10.88.4.3
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=k49
DB_PASSWORD=123456

LOG_CHANNEL=stack
LOG_LEVEL=debug
EOF

php artisan key:generate

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 8002;
    server_name isildur.laravel.com;
    root /var/www/laravel/public;

    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}

server {
    listen 8002 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
nginx -t && service nginx restart

echo ""
echo "✅ [ISILDUR] Laravel terhubung ke Palantir"
echo "✅ Port: 8002"
echo ""

# Anarion
echo "=========================================="
echo "     [ANARION] - Database & Port Config"
echo "=========================================="

cd /var/www/laravel

cat > .env <<'EOF'
APP_NAME=Laravel
APP_ENV=production
APP_KEY=
APP_DEBUG=false
APP_URL=http://anarion.laravel.com

DB_CONNECTION=mysql
DB_HOST=10.88.4.3
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=k49
DB_PASSWORD=123456

LOG_CHANNEL=stack
LOG_LEVEL=debug
EOF

php artisan key:generate

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 8003;
    server_name anarion.laravel.com;
    root /var/www/laravel/public;

    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}

server {
    listen 8003 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
nginx -t && service nginx restart

echo ""
echo "✅ [ANARION] Laravel terhubung ke Palantir"
echo "✅ Port: 8003"
echo ""

# Amandil atau Gilgalad
echo "=========================================="
echo "           TESTING AKSES WEB"
echo "=========================================="

apt-get update && apt-get install -y lynx curl

echo ""
echo "🔹 Tes akses via domain (seharusnya SUKSES)"
lynx -dump http://elendil.laravel.com:8001 | head -n 10
lynx -dump http://isildur.laravel.com:8002 | head -n 10
lynx -dump http://anarion.laravel.com:8003 | head -n 10

echo ""
echo "Tes akses via IP (seharusnya DITOLAK)"
curl -I http://10.88.1.2:8001
curl -I http://10.88.1.3:8002
curl -I http://10.88.1.4:8003

echo ""
echo "=========================================="
echo "     ✅ SEMUA BENTENG TERKONFIGURASI"
echo "     ✅ DATABASE TERHUBUNG KE PALANTIR"
echo "=========================================="
