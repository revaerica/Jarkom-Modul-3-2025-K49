# Pharazon
echo "=========================================="
echo "   PHARAZON - PHP LOAD BALANCER SETUP"
echo "=========================================="

echo "nameserver 10.88.5.2" > /etc/resolv.conf

apt-get update
apt-get install -y nginx

cat > /etc/nginx/sites-available/php-load-balancer <<'EOF'
upstream taman_peri {
    server 10.88.2.6:8004;
    server 10.88.2.5:8005; 
    server 10.88.2.4:8006; 
}

# Server utama: Pharazon
server {
    listen 80;
    server_name pharazon.jarkomK49.com;

    location / {
        proxy_pass http://taman_peri;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    access_log /var/log/nginx/pharazon_access.log;
    error_log /var/log/nginx/pharazon_error.log;
}

# Block IP access langsung tanpa domain
server {
    listen 80 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/php-load-balancer /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service nginx restart

echo ""
echo "=========================================="
echo "   PHARAZON LOAD BALANCER READY!"
echo "=========================================="
echo "✅ Domain : pharazon.jarkomK49.com"
echo "✅ Algoritma : Round Robin (default)"
echo "✅ Backend Workers:"
echo "   - Galadriel (10.88.2.6:8004)"
echo "   - Celeborn  (10.88.2.5:8005)"
echo "   - Oropher   (10.88.2.4:8006)"

# Testing dari Client
echo ""
echo "=========================================="
echo "   TESTING PHARAZON LOAD BALANCER"
echo "=========================================="

# CONSOLE: CLIENT (Gilgalad / Amandil)
cat > /etc/resolv.conf <<EOF
nameserver 10.88.5.2
EOF

apt-get update
apt-get install -y lynx curl

echo ""
echo "=== Test: akses via lynx ==="
lynx -dump http://pharazon.jarkomK49.com

echo ""
echo "=== Test: Multiple requests (Round Robin) ==="
for i in {1..6}; do
    echo "Request #$i:"
    curl -s http://pharazon.jarkomK49.com
    echo ""
done

echo ""
echo "Expected: Hostname harus berganti antara Galadriel, Celeborn, dan Oropher"

echo ""
echo "=========================================="
echo "   NOMOR 13 COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Load Balancer configured"
echo "✅ Round Robin aktif"
echo "✅ Requests didistribusikan ke semua worker"
