#!/bin/bash
echo "=========================================="
echo "      TESTING INDIVIDUAL WORKERS"
echo "=========================================="
echo ""

# Pastikan paket untuk testing ada
apt-get update -y
apt-get install -y lynx curl

WORKERS=(
    "elendil.laravel.com:8001"
    "isildur.laravel.com:8002"
    "anarion.laravel.com:8003"
)

for w in "${WORKERS[@]}"; do
    NAME=$(echo $w | cut -d. -f1)
    PORT=$(echo $w | cut -d: -f2)
    DOMAIN=$(echo $w | cut -d: -f1-2)

    echo "------------------------------------------"
    echo " TESTING $NAME ($DOMAIN)"
    echo "------------------------------------------"

    # Tes halaman utama Laravel
    echo ">>> Halaman utama"
    lynx -dump http://$w | head -n 10 || echo "[!] Gagal mengakses halaman utama $NAME"

    # Tes API /api/airing
    echo ">>> API /api/airing"
    curl -s http://$w/api/airing || echo "[!] Gagal mengakses API $NAME"

    echo ""
done

echo "✅ Semua worker berhasil dites via domain!"
echo "=========================================="
