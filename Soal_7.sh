# Elendil/Isildur/Anarion
#!/bin/bash

setup_laravel_worker() {
    HOSTNAME=$(hostname | tr '[:lower:]' '[:upper:]')
    IP=$(hostname -I | awk '{print $1}')

    echo "=========================================="
    echo "        $HOSTNAME - Laravel Worker"
    echo "=========================================="

    echo "nameserver 192.168.122.1" > /etc/resolv.conf

    apt update -y
    apt install -y lsb-release ca-certificates apt-transport-https curl gnupg

    curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/php.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

    apt update -y
    apt install -y php8.4 php8.4-fpm php8.4-mysql php8.4-xml php8.4-curl \
                   php8.4-mbstring php8.4-zip php8.4-gd php8.4-cli composer nginx git unzip

    service php8.4-fpm restart

    rm -rf /var/www/laravel

    cd /var/www
    git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel
    cd laravel

    git config --global --add safe.directory /var/www/laravel

    composer update --no-interaction --prefer-dist --optimize-autoloader || composer install --no-interaction

    cp .env.example .env
    php artisan key:generate || echo "⚠️ Laravel key belum digenerate, cek vendor autoload"

    chown -R www-data:www-data /var/www/laravel
    chmod -R 755 /var/www/laravel/storage

    cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;

    root /var/www/laravel/public;
    index index.php index.html;

    access_log /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;

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

    ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/laravel
    rm -f /etc/nginx/sites-enabled/default

    service php8.4-fpm restart
    service nginx restart

    echo "✅ $HOSTNAME siap diakses di http://$IP"
    echo
}

setup_laravel_worker "$HOSTNAME" "$IP"

# Amandil atau Gilgalad
echo "=========================================="
echo "         TESTING DARI CLIENT"
echo "=========================================="

apt install -y lynx -y

for IP in 10.88.1.2 10.88.1.3 10.88.1.4; do
    echo
    echo "=== Uji koneksi Laravel Worker ($IP) ==="
    lynx -dump http://$IP | head -n 10 || echo "Gagal mengakses $IP"
done

echo
echo "=========================================="
echo " SEMUA WORKER BERHASIL DIUJI!"
echo "=========================================="
