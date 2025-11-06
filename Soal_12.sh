# PHP WORKER SETUP (Galadriel, Celeborn, Oropher)

# Fungsi untuk setup PHP worker
setup_php_worker() {
    WORKER_NAME=$1
    PORT=$2
    echo "=========================================="
    echo "     $WORKER_NAME - PHP WORKER"
    echo "=========================================="

    echo "nameserver 10.88.5.2" > /etc/resolv.conf

    apt-get update -y
    apt-get install -y nginx php-fpm php-cli -y

    # Deteksi otomatis versi PHP-FPM yang aktif
    PHP_SOCK=$(find /var/run/php/ -name "php*-fpm.sock" | head -n1)
    if [ -z "$PHP_SOCK" ]; then
        echo "⚠️ Tidak ditemukan socket PHP-FPM, mencoba start service..."
        service php8.1-fpm start 2>/dev/null || service php8.4-fpm start 2>/dev/null || service php7.4-fpm start 2>/dev/null
        PHP_SOCK=$(find /var/run/php/ -name "php*-fpm.sock" | head -n1)
    fi
    echo "🧩 Menggunakan PHP socket: $PHP_SOCK"

    mkdir -p /var/www/html
    cat > /var/www/html/index.php <<'EOF'
<?php
$hostname = gethostname();
echo "Hostname: $hostname\n";
?>
EOF

    chown -R www-data:www-data /var/www/html

    cat > /etc/nginx/sites-available/php-site <<EOF
server {
    listen $PORT;
    server_name $WORKER_NAME.jarkomK49.com;
    root /var/www/html;
    
    index index.php index.html index.htm;

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:$PHP_SOCK;
    }

    location / {
        try_files \$uri \$uri/ =404;
    }
}

# Block IP access langsung
server {
    listen $PORT default_server;
    server_name _;
    return 444;
}
EOF

    ln -sf /etc/nginx/sites-available/php-site /etc/nginx/sites-enabled/
    rm -f /etc/nginx/sites-enabled/default

    nginx -t && service nginx restart

    echo "✅ $WORKER_NAME siap diakses di $WORKER_NAME.jarkomK49.com:$PORT"
}

# Jalankan untuk masing-masing worker
setup_php_worker "galadriel" 8004
setup_php_worker "celeborn" 8005
setup_php_worker "oropher" 8006

# CLIENT TESTING (Gilgalad / Amandil)
echo "=========================================="
echo "        TESTING PHP WORKERS (CLIENT)"
echo "=========================================="

cat > /etc/resolv.conf <<EOF
nameserver 10.88.5.2
EOF

apt-get update -y
apt-get install -y lynx curl -y

for worker in galadriel celeborn oropher; do
    case $worker in
        galadriel) port=8004 ;;
        celeborn)  port=8005 ;;
        oropher)   port=8006 ;;
    esac

    echo ""
    echo "=== Testing $worker ==="
    if ! lynx -dump http://$worker.jarkomK49.com:$port; then
        echo "⚠️ Lynx gagal, coba dengan curl:"
        curl -v http://$worker.jarkomK49.com:$port
    fi
done

echo ""
echo "=========================================="
echo "              COMPLETE!"
echo "=========================================="
echo "=========================================="
