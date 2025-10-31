# Elros
apt-get update && apt-get install nginx -y

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
systemctl restart nginx

# Pharazon
apt-get update && apt-get install nginx -y

cat > /etc/nginx/sites-available/numenor-web <<EOF
upstream php_workers {
    server 10.88.2.2;  # Galadriel
    server 10.88.2.3;  # Celeborn
    server 10.88.2.4;  # Oropher
}

server {
    listen 80;
    server_name numenor-web.jarkomK49.com www.jarkomK49.com;

    location / {
        proxy_pass http://php_workers;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

ln -s /etc/nginx/sites-available/numenor-web /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
systemctl restart nginx

# Elendil, Isildur, Anarion
apt-get update
apt-get install nginx php8.4-fpm php8.4-curl php8.4-mbstring php8.4-xml php8.4-mysql git -y

cd /var/www/
git clone https://github.com/elshiraphine/laravel-simple-rest-api laravel-web
chown -R www-data:www-data /var/www/laravel-web/

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

systemctl restart php8.4-fpm
systemctl restart nginx

# Galadriel, Celeborn, Oropher
apt-get update
apt-get install nginx php8.4-fpm -y

mkdir -p /var/www/numenor-web/
echo "<?php echo 'Halo dari Worker: ' . gethostname() . ' (' . \$_SERVER['SERVER_ADDR'] . ')'; ?>" > /var/www/numenor-web/index.php
chown -R www-data:www-data /var/www/numenor-web/

cat > /etc/nginx/sites-available/numenor-web <<EOF
server {
    listen 80 default_server;
    root /var/www/numenor-web/;
    index index.php index.html;
    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }
}
EOF

ln -s /etc/nginx/sites-available/numenor-web /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

systemctl restart php8.4-fpm
systemctl restart nginx

# Gilgalad atai Amandil
curl numenor-web.jarkomK49.com
curl laravel-web.jarkomK49.com/api/item
