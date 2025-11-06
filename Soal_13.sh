# Pharazon
echo "=========================================="
echo "   PHARAZON - PHP LOAD BALANCER SETUP"
echo "=========================================="

cat >> /etc/hosts <<EOF
10.88.2.6 galadriel.jarkomK49.com
10.88.2.5 celeborn.jarkomK49.com
10.88.2.4 oropher.jarkomK49.com
EOF

echo "nameserver 10.88.5.2" > /etc/resolv.conf

apt-get update -y
apt-get install -y nginx dnsutils curl lynx -y

echo ""
echo "🔍 Mengecek resolusi domain worker..."
for host in galadriel.jarkomK49.com celeborn.jarkomK49.com oropher.jarkomK49.com; do
    ip=$(dig +short $host)
    if [ -z "$ip" ]; then
        echo "⚠️ Tidak bisa resolve $host"
    else
        echo "✅ $host -> $ip"
    fi
done

cat > /etc/nginx/sites-available/php-load-balancer <<'EOF'
upstream taman_peri {
    server galadriel.jarkomK49.com:8004;
    server celeborn.jarkomK49.com:8005;
    server oropher.jarkomK49.com:8006;
}

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

server {
    listen 80 default_server;
    server_name _;
    return 444;
}
EOF

ln -sf /etc/nginx/sites-available/php-load-balancer /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t && systemctl restart nginx

echo ""
echo "=========================================="
echo "   ✅ PHARAZON LOAD BALANCER READY!"
echo "=========================================="
echo "Domain       : pharazon.jarkomK49.com"
echo "Algoritma    : Round Robin (default)"
echo "Backend      :"
echo "  - galadriel.jarkomK49.com:8004"
echo "  - celeborn.jarkomK49.com:8005"
echo "  - oropher.jarkomK49.com:8006"
echo ""

# Amandil/Gilgalad
echo ""
echo "=========================================="
echo "   🔍 TESTING WORKER DAN LOAD BALANCER"
echo "=========================================="

echo "nameserver 10.88.5.2" > /etc/resolv.conf
apt-get install -y curl lynx -y

for worker in galadriel celeborn oropher; do
    case $worker in
        galadriel) ip=10.88.2.6; port=8004 ;;
        celeborn)  ip=10.88.2.5; port=8005 ;;
        oropher)   ip=10.88.2.4; port=8006 ;;
    esac

    echo ""
    echo "=== Testing $worker ==="
    echo "- via DOMAIN:"
    curl -s http://$worker.jarkomK49.com:$port || echo "⚠️ Gagal (domain)"
    echo ""
    echo "- via IP LANGSUNG (harus DITOLAK):"
    curl -v http://$ip:$port || echo "⚠️ Gagal (ip, expected)"
done

echo ""
echo "=========================================="
echo "   ✅ TESTING LOAD BALANCER PHARAZON"
echo "=========================================="

echo "- Akses lewat domain (harus BERHASIL & Round Robin):"
for i in {1..6}; do
    echo "Request #$i:"
    curl -s http://pharazon.jarkomK49.com || echo "⚠️ Gagal ambil response!"
    echo ""
done

echo ""
echo "- Akses via IP langsung Pharazon (harus DITOLAK):"
curl -v http://10.88.2.2 || echo "⚠️ DITOLAK (expected)"

echo ""
echo "=========================================="
echo "   🧾 HASIL TESTING"
echo "=========================================="
echo "✅ Akses via domain worker: Harus tampil hostname (Galadriel, Celeborn, Oropher)"
echo "✅ Akses via IP worker: Harus ditolak (return 444 / Empty reply)"
echo "✅ Akses via pharazon.jarkomK49.com: Round robin antara 3 worker"
echo "✅ Akses via IP Pharazon: Harus ditolak (return 444)"
echo "=========================================="
