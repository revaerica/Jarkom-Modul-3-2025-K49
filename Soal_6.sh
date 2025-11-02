# Konfigurasi sudah dilakukan di Soal_2.sh
# Cek di DHCP Server (Aldarion)
cat /var/lib/dhcp/dhcpd.leases | grep lease -A 3
