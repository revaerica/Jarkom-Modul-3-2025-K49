# Palantir
echo "=========================================="
echo "       [PALANTIR] - MySQL Database"
echo "=========================================="

apt update -y
apt install -y mariadb-server

service mariadb start

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS laravel;
CREATE USER IF NOT EXISTS 'k49'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON laravel.* TO 'k49'@'%';
FLUSH PRIVILEGES;
EOF

sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb restart

echo "✅ [PALANTIR] Database siap di 10.88.4.3 (user: k49, pass: 123456)"
echo

wait_for_db() {
  echo "Menunggu Palantir siap..."
  until mysql -h10.88.4.3 -uk49 -p123456 -e "SELECT 1;" &> /dev/null; do
    sleep 2
  done
  echo "✅ Palantir siap menerima koneksi!"
}
wait_for_db

# Elendil, Isildur, Anarion
setup_worker() {
    WORKER_NAME=$1
    WORKER_IP=$2
    WORKER_PORT=$3
    LOG_FILE="/tmp/${WORKER_NAME}.log"

    echo "==========================================" | tee $LOG_FILE
    echo "     [$WORKER_NAME] - Database & Port Config" | tee -a $LOG_FILE
    echo "==========================================" | tee -a $LOG_FILE

    cd /var/www || mkdir -p /var/www && cd /var/www

    if [ ! -d laravel ]; then
      git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel | tee -a $LOG_FILE
    fi
    cd laravel
    git config --global --add safe.directory /var/www/laravel

    composer install --no-interaction --prefer-dist | tee -a $LOG_FILE

    cat > .env <<EOF
APP_NAME=Laravel
APP_ENV=production
APP_KEY=
APP_DEBUG=false
APP_URL=http://$WORKER_NAME.laravel.com

DB_CONNECTION=mysql
DB_HOST=10.88.4.3
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=k49
DB_PASSWORD=123456

LOG_CHANNEL=stack
LOG_LEVEL=debug
EOF

    php artisan key:generate --force | tee -a $LOG_FILE

    cat > /etc/nginx/sites-available/$WORKER_NAME <<EOF
server {
    listen $WORKER_PORT;
    server_name $WORKER_NAME.laravel.com;
    root /var/www/laravel/public;

    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}

server {
    listen $WORKER_PORT default_server;
    server_name _;
    return 444;
}
EOF

    ln -sf /etc/nginx/sites-available/$WORKER_NAME /etc/nginx/sites-enabled/
    nginx -t | tee -a $LOG_FILE && service nginx restart

    chown -R www-data:www-data /var/www/laravel
    chmod -R 755 /var/www/laravel/storage

    echo "✅ [$WORKER_NAME] Laravel terhubung ke Palantir" | tee -a $LOG_FILE
    echo "✅ Port: $WORKER_PORT" | tee -a $LOG_FILE
    echo | tee -a $LOG_FILE
}

# Setup masing-masing worker
setup_worker "elendil" "10.88.1.2" 8001
setup_worker "isildur" "10.88.1.3" 8002
setup_worker "anarion" "10.88.1.4" 8003

# Elendil
cd /var/www/laravel
php artisan migrate:fresh --seed | tee /tmp/migrate.log || echo "Migrate gagal, cek /tmp/migrate.log"
echo "✅ Migrasi & seeding Elendil selesai"

# Elendil, Isildur, Anarion
for i in elendil isildur anarion; do
    IP_VAR=$(eval echo \$${i^^}_IP)
    grep -q "$IP_VAR $i.laravel.com" /etc/hosts || echo "$IP_VAR $i.laravel.com" >> /etc/hosts
done

# Amandil/Gilgalad
echo "10.88.1.2 elendil.laravel.com" >> /etc/hosts
echo "10.88.1.3 isildur.laravel.com" >> /etc/hosts
echo "10.88.1.4 anarion.laravel.com" >> /etc/hosts

ping -c 2 elendil.laravel.com
ping -c 2 isildur.laravel.com
ping -c 2 anarion.laravel.com

apt-get install -y lynx curl

echo "Tes akses via domain (harus sukses)"
lynx -dump http://elendil.laravel.com:8001 | head -n 10
lynx -dump http://isildur.laravel.com:8002 | head -n 10
lynx -dump http://anarion.laravel.com:8003 | head -n 10

echo
echo "Tes akses via IP (harus gagal)"
curl -I http://10.88.1.2:8001
curl -I http://10.88.1.3:8002
curl -I http://10.88.1.4:8003

echo
echo "=========================================="
echo "     ✅ SEMUA BENTENG TERKONFIGURASI"
echo "     ✅ DATABASE TERHUBUNG KE PALANTIR"
echo "=========================================="
