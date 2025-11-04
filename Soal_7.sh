# Ewlendil
echo "=========================================="
echo "        ELENDIL - Laravel Worker 1"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt update -y
apt install -y php8.4 php8.4-fpm php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-zip php8.4-gd composer nginx git unzip curl

service php8.4-fpm start

cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel
cd laravel
composer install --no-interaction --prefer-dist --optimize-autoloader
cp .env.example .env
php artisan key:generate

chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;
    root /var/www/laravel/public;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service nginx restart

echo "✅ Elendil siap diakses di http://10.88.1.2"
echo

# Isildur
echo "=========================================="
echo "        ISILDUR - Laravel Worker 2"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt update -y
apt install -y php8.4 php8.4-fpm php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-zip php8.4-gd composer nginx git unzip curl

service php8.4-fpm start

cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel
cd laravel
composer install --no-interaction --prefer-dist --optimize-autoloader
cp .env.example .env
php artisan key:generate

chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;
    root /var/www/laravel/public;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service nginx restart

echo "✅ Isildur siap diakses di http://10.88.1.3"
echo

# Anarion
echo "=========================================="
echo "        ANARION - Laravel Worker 3"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt update -y
apt install -y php8.4 php8.4-fpm php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-zip php8.4-gd composer nginx git unzip curl

service php8.4-fpm start

cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel
cd laravel
composer install --no-interaction --prefer-dist --optimize-autoloader
cp .env.example .env
php artisan key:generate

chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;
    root /var/www/laravel/public;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
service nginx restart

echo "✅ Anarion siap diakses di http://10.88.1.4"
echo

# Client Test bisa Amandil atau Gilgalad dll
echo "=========================================="
echo "         TESTING DARI CLIENT"
echo "=========================================="

apt update -y
apt install -y lynx

echo
echo "=== Uji koneksi Laravel Worker 1 (Elendil) ==="
lynx -dump http://10.88.1.2 | head -n 10

echo
echo "=== Uji koneksi Laravel Worker 2 (Isildur) ==="
lynx -dump http://10.88.1.3 | head -n 10

echo
echo "=== Uji koneksi Laravel Worker 3 (Anarion) ==="
lynx -dump http://10.88.1.4 | head -n 10

echo
echo "=========================================="
echo " SEMUA WORKER BERHASIL DIUJI!"
echo "=========================================="
