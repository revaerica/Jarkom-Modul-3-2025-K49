echo "=========================================="
echo "      TESTING INDIVIDUAL WORKERS"
echo "=========================================="
echo ""

echo "[CLIENT] Setting DNS resolver..."
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
EOF

echo "[CLIENT] Installing lynx & curl..."
apt-get update -y
apt-get install -y lynx curl

echo ""
echo "------------------------------------------"
echo " TESTING ELENDIL (Worker 1 - Port 8001)"
echo "------------------------------------------"
lynx -dump http://10.88.1.2:8001 || echo "[!] Gagal mengakses halaman utama Elendil"
curl -I http://10.88.1.2:8001
curl http://10.88.1.2:8001/api/airing
echo ""

echo "------------------------------------------"
echo " TESTING ISILDUR (Worker 2 - Port 8002)"
echo "------------------------------------------"
lynx -dump http://10.88.1.3:8002 || echo "[!] Gagal mengakses halaman utama Isildur"
curl -I http://10.88.1.3:8002
curl http://10.88.1.3:8002/api/airing
echo ""

echo "------------------------------------------"
echo " TESTING ANARION (Worker 3 - Port 8003)"
echo "------------------------------------------"
lynx -dump http://10.88.1.4:8003 || echo "[!] Gagal mengakses halaman utama Anarion"
curl -I http://10.88.1.4:8003
curl http://10.88.1.4:8003/api/airing
echo ""

echo "✅ Semua worker berhasil dites!"
echo "Cek log error jika ada masalah: /var/log/nginx/error.log"
echo "=========================================="
