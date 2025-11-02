# Di Client (misalnya Amandil)
echo "=========================================="
echo "   BENCHMARK TESTING - ROUND ROBIN"
echo "=========================================="

apt update -y
apt install -y apache2-utils

echo
echo "[Client] Menjalankan pengujian awal (100 requests, 10 concurrent)..."
ab -n 100 -c 10 http://10.88.1.35/api/airing

echo
echo "[Client] Menjalankan pengujian penuh (2000 requests, 100 concurrent)..."
ab -n 2000 -c 100 http://10.88.1.35/api/airing

echo
echo "=== Mengecek log di Elros (Load Balancer) ==="
echo "[Console: Elros]"
tail -n 20 /var/log/nginx/elros_access.log | grep "10.88.1"

echo
echo "=========================================="
echo "   STRATEGI BERTAHAN - WEIGHTED ROUND ROBIN"
echo "=========================================="

cat > /etc/nginx/sites-available/load-balancer <<'EOF'
upstream kesatria_numenor {
    server 10.88.1.2 weight=3; # Elendil (lebih kuat)
    server 10.88.1.3 weight=2; # Isildur
    server 10.88.1.4 weight=1; # Anarion
}

server {
    listen 80;
    server_name 10.88.1.35;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    access_log /var/log/nginx/elros_access.log;
    error_log /var/log/nginx/elros_error.log;
}
EOF

nginx -t && service nginx restart

echo
echo "✅ Weighted Round Robin diaktifkan"
echo "   - Elendil (10.88.1.2): weight=3"
echo "   - Isildur (10.88.1.3): weight=2"
echo "   - Anarion (10.88.1.4): weight=1"

echo
echo "[Client] Menjalankan pengujian ulang dengan Weighted Round Robin..."
ab -n 2000 -c 100 http://10.88.1.35/api/airing

echo
echo "=== Bandingkan distribusi di log Elros ==="
tail -n 30 /var/log/nginx/elros_access.log | grep "10.88.1"

echo
echo "=========================================="
echo "   SEMUA PENGUJIAN SELESAI!"
echo "=========================================="
