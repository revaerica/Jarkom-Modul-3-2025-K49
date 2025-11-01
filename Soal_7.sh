# Elendil
echo "=========================================="
echo "      ELENDIL - LARAVEL WORKER 1"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 curl wget git unzip

curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

apt-get update
apt-get install -y php8.4 php8.4-fpm php8.4-cli php8.4-common php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-zip php8.4-gd php8.4-intl php8.4-bcmath

php -v

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

apt-get install -y nginx

service php8.4-fpm start
service php8.4-fpm status

cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel

cd /var/www/laravel
chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage

composer install --no-interaction --prefer-dist --optimize-autoloader

cp .env.example .env
php artisan key:generate

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;
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
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service php8.4-fpm restart
service nginx restart

echo ""
echo "=========================================="
echo "      ELENDIL SETUP COMPLETE!"
echo "=========================================="
echo "✅ PHP 8.4 installed"
echo "✅ Composer installed"
echo "✅ Nginx configured"
echo "✅ Laravel deployed"
echo ""
echo "Test: curl http://10.88.1.2"

# Isildur
echo "=========================================="
echo "      ISILDUR - LARAVEL WORKER 2"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf

apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 curl wget git unzip

curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

apt-get update
apt-get install -y php8.4 php8.4-fpm php8.4-cli php8.4-common php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-zip php8.4-gd php8.4-intl php8.4-bcmath

php -v

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

apt-get install -y nginx

service php8.4-fpm start

cd /var/www
git clone https://github.com/do-zoo/Resource-laravel.git laravel

cd /var/www/laravel
chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage

composer install --no-interaction --prefer-dist --optimize-autoloader

cp .env.example .env
php artisan key:generate

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;
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
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service php8.4-fpm restart
service nginx restart

echo ""
echo "=========================================="
echo "      ISILDUR SETUP COMPLETE!"
echo "=========================================="
echo "✅ PHP 8.4 installed"
echo "✅ Composer installed"
echo "✅ Nginx configured"
echo "✅ Laravel deployed"

# Anarion
echo "=========================================="
echo "      ANARION - LARAVEL WORKER 3"
echo "=========================================="

echo "nameserver 192.168.122.1" > /etc/resolv.conf

apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 curl wget git unzip

curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

apt-get update
apt-get install -y php8.4 php8.4-fpm php8.4-cli php8.4-common php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-zip php8.4-gd php8.4-intl php8.4-bcmath

php -v

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

apt-get install -y nginx

service php8.4-fpm start

cd /var/www
git clone https://github.com/do-zoo/Resource-laravel.git laravel

cd /var/www/laravel
chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage

composer install --no-interaction --prefer-dist --optimize-autoloader

cp .env.example .env
php artisan key:generate

cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;
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
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service php8.4-fpm restart
service nginx restart

echo ""
echo "=========================================="
echo "      ANARION SETUP COMPLETE!"
echo "=========================================="
echo "✅ PHP 8.4 installed"
echo "✅ Composer installed"
echo "✅ Nginx configured"
echo "✅ Laravel deployed"

# Gilgalad atau Amandil
echo "=========================================="
echo "      TESTING DARI CLIENT"
echo "=========================================="

apt-get update
apt-get install -y lynx

echo ""
echo "=== Testing Laravel Worker 1 (Elendil) ==="
lynx -dump http://10.88.1.2

echo ""
echo "=== Testing Laravel Worker 2 (Isildur) ==="
lynx -dump http://10.88.1.3

echo ""
echo "=== Testing Laravel Worker 3 (Anarion) ==="
lynx -dump http://10.88.1.4

echo ""
echo "=========================================="
echo "      ALL WORKERS TESTED!"
echo "=========================================="
echo ""
echo "✅ Elendil (10.88.1.2) - Laravel Worker 1"
echo "✅ Isildur (10.88.1.3) - Laravel Worker 2"
echo "✅ Anarion (10.88.1.4) - Laravel Worker 3"
echo ""
echo "Menampilkan halaman Laravel!"
