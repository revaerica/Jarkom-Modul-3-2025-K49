# Elros
echo "=========================================="
echo "   ELROS - Load Balancer Setup"
echo "=========================================="

echo "[Elros] Updating system..."
apt-get update -y

echo "[Elros] Installing nginx..."
apt-get install -y nginx

echo "[Elros] Configuring Nginx Load Balancer..."

cat > /etc/nginx/sites-available/load-balancer <<'EOF'

upstream kesatria_numenor {
    server 10.88.1.2:8001;   # Elendil
    server 10.88.1.3:8002;   # Isildur
    server 10.88.1.4:8003;   # Anarion
}

server {
    listen 80;
    server_name 10.88.1.35;  # Elros (gunakan IP langsung untuk stabilitas)

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

ln -sf /etc/nginx/sites-available/load-balancer /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

echo "[Elros] Testing Nginx configuration..."
nginx -t

echo "[Elros] Restarting Nginx..."
service nginx restart

echo ""
echo "✅ Load Balancer berhasil dikonfigurasi di Elros (10.88.1.35)"
echo "✅ Reverse Proxy aktif dengan algoritma Round Robin"
echo "✅ Backend: 10.88.1.2:8001 | 10.88.1.3:8002 | 10.88.1.4:8003"
echo ""
echo "Gunakan perintah di client untuk uji coba:"
echo "  curl http://10.88.1.35/api/airing"
echo "  (Lakukan beberapa kali untuk melihat rotasi worker)"
