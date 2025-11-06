# Jarkom-Modul-3-2025-K49

| Nama                       | NRP        |
| -------------------------- | ---------- |
| Revalina Erica Permatasari | 5027241007 |
| Muhammad Rafi` Adly        | 5027241082 |

**Daftar Isi** 
1. [Soal 1](#Soal-1)
2. [Soal 2](#Soal-2)
3. [Soal 3](#Soal-3)
4. [Soal 4](#Soal-4)
5. [Soal 5](#Soal-5)
6. [Soal 6](#Soal-6)
7. [Soal 7](#Soal-7)
8. [Soal 8](#Soal-8)
9. [Soal 9](#Soal-9)
10. [Soal 10](#Soal-10)
11. [Soal 11](#Soal-11)
12. [Soal 12](#Soal-12)
13. [Soal 13](#Soal-13)
14. [Soal 14](#Soal-14)
15. [Soal 15](#Soal-15)

## Soal 1

<img width="820" height="785" alt="image" src="https://github.com/user-attachments/assets/4ffb07ab-6bc6-48b9-a419-5ba6642bda47" />

**Durin**
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.88.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.88.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 10.88.3.1
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 10.88.4.1
	netmask 255.255.255.0

auto eth5
iface eth5 inet static
	address 10.88.5.1
	netmask 255.255.255.0

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update -y
up apt-get install iptables isc-dhcp-relay -y
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
```

**Elendil**
```
auto eth0
iface eth0 inet static
	address 10.88.1.2
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Isildur**
```
auto eth0
iface eth0 inet static
	address 10.88.1.3
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Anarion**
```
auto eth0
iface eth0 inet static
	address 10.88.1.4
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Miriel**
```
auto eth0
iface eth0 inet static
	address 10.88.1.5
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Celebrimbor**
```
auto eth0
iface eth0 inet static
	address 10.88.2.3
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Elros**
```
auto eth0
iface eth0 inet static
    address 10.88.1.10 
    netmask 255.255.255.0
    gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Pharazon**
```
auto eth0
iface eth0 inet static
	address 10.88.2.2
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Galadriel**
```
auto eth0
iface eth0 inet static
	address 10.88.2.6
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Celeborn**
```
auto eth0
iface eth0 inet static
	address 10.88.2.5
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Oropher**
```
auto eth0
iface eth0 inet static
	address 10.88.2.4
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Erendis**
```
auto eth0
iface eth0 inet static
	address 10.88.3.2
	netmask 255.255.255.0
	gateway 10.88.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Amdir**
```
auto eth0
iface eth0 inet static
	address 10.88.3.3
	netmask 255.255.255.0
	gateway 10.88.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Aldarion**
```
auto eth0
iface eth0 inet static
    address 10.88.4.2
    netmask 255.255.255.0
    gateway 10.88.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Palantir**
```
auto eth0
iface eth0 inet static
	address 10.88.4.3
	netmask 255.255.255.0
	gateway 10.88.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Narvi**
```
auto eth0
iface eth0 inet static
	address 10.88.4.4
	netmask 255.255.255.0
	gateway 10.88.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Minastir**
```
auto eth0
iface eth0 inet static
	address 10.88.5.2
	netmask 255.255.255.0
	gateway 10.88.5.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install bind9 nginx -y
```

**Gilgalad**
```
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Amandil**
```
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

**Khamul**
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

hwaddress ether 02:42:92:bc:4c:00

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

Amandil
<img width="1725" height="1228" alt="image" src="https://github.com/user-attachments/assets/8d072242-1380-4771-8e7f-342f4a8edbd9" />

Gilgalad
<img width="1375" height="1225" alt="image" src="https://github.com/user-attachments/assets/1ed86e50-357f-4483-baee-6d1169559bf8" />

### 1. NAT dan Forwarding
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth4 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth5 -o eth0 -j ACCEPT

iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth3 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth4 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth5 -j ACCEPT
```
**Penjelasan**
- `MASQUERADE`: mengaktifkan NAT (Network Address Translation) agar seluruh jaringan lokal 10.88.0.0/16 dapat mengakses internet melalui interface eth0.
- Baris `FORWARD`: mengizinkan lalu lintas dua arah antara interface internal (eth1–eth5) dan interface eksternal (eth0).

### 2. Mengizinkan ICMP (Ping)
```
iptables -A INPUT -i eth1 -p icmp -j ACCEPT 
iptables -A INPUT -i eth2 -p icmp -j ACCEPT 
iptables -A INPUT -i eth3 -p icmp -j ACCEPT 
iptables -A INPUT -i eth4 -p icmp -j ACCEPT 
iptables -A INPUT -i eth5 -p icmp -j ACCEPT
```
**Penjelasan**
- Baris ini memperbolehkan masing-masing subnet internal melakukan komunikasi ICMP (ping) ke router Durin.
- Hal ini mempermudah pengujian koneksi antar perangkat di jaringan lokal.
  
### 3. Konfigurasi DHCP Relay
```
cat > /etc/default/isc-dhcp-relay << EOF
SERVERS="10.88.4.2"
INTERFACES="eth1 eth2 eth3 eth4 eth5"
OPTIONS=""
EOF

service isc-dhcp-relay restart
```
**Penjelasan**
- `SERVERS` : IP address dari DHCP server pusat (contoh: 10.88.4.2).
- `INTERFACES` : daftar interface yang akan menerima permintaan DHCP dari klien dan meneruskannya ke server DHCP.
- `isc-dhcp-relay` : service yang berfungsi untuk meneruskan (relay) permintaan DHCP antar subnet.

### 4. Amandil
Amandil berperan sebagai client di subnet pertama (10.88.1.0/24).
```
ip addr flush dev eth0
ip addr add 10.88.1.100/24 dev eth0
ip link set eth0 up
ip route add default via 10.88.1.1
```
**Penjelasan**
- `ip addr flush dev eth0`: menghapus semua konfigurasi IP lama dari interface eth0.
- `ip addr add`: menetapkan alamat IP baru (10.88.1.100) dengan subnet mask /24.
- `ip route add default via`: menambahkan rute default melalui gateway 10.88.1.1 (router Durin).

### 5. Gilgalad
Gilgalad berada di subnet kedua (10.88.2.0/24) dengan konfigurasi yang mirip seperti Amandil.
```
ip addr flush dev eth0
ip addr add 10.88.2.100/24 dev eth0
ip link set eth0 up
ip route add default via 10.88.2.1
```
**Penjelasan**
- IP statis diatur menjadi 10.88.2.100/24.
- Default gateway diarahkan ke 10.88.2.1 (Durin).

### 6. Pengujian Koneksi dan DNS
```
echo nameserver 192.168.122.1 > /etc/resolv.conf

ping -c 3 10.88.1.1     
ping -c 3 10.88.2.1     
ping -c 3 192.168.122.1 

apt-get update
apt-get install isc-dhcp-client -y

echo nameserver 10.88.5.2 > /etc/resolv.conf
```
**Penjelasan**
- `echo nameserver 192.168.122.1`: menetapkan DNS sementara agar sistem bisa melakukan update paket (apt-get update).
- `ping`: menguji konektivitas ke router dan gateway eksternal.
- `isc-dhcp-client`: menginstal DHCP client agar host bisa mendapatkan IP otomatis dari server DHCP.
- `echo nameserver 10.88.5.2`: mengubah konfigurasi DNS ke server DNS internal setelah semua sistem aktif.

## Soal 2
Agar DHCP Server ter-set, di Aldarion konfigurasikan sebagai berikut.
```
apt-get update && apt-get install isc-dhcp-server -y

cat > /etc/default/isc-dhcp-server <<EOF
INTERFACES="eth0"
EOF

cat > /etc/dhcp/dhcpd.conf <<EOF
authoritative;
max-lease-time 3600; 
option domain-name-servers 10.88.5.2; 
option domain-name "jarkomK49.com";

subnet 10.88.1.0 netmask 255.255.255.0 {
	range 10.88.1.6 10.88.1.34;
	range 10.88.1.68 10.88.1.94;
	option routers 10.88.1.1;
	option broadcast-address 10.88.1.255;
	default-lease-time 1800;
}

subnet 10.88.2.0 netmask 255.255.255.0 {
	range 10.88.2.35 10.88.2.67;
	range 10.88.2.96 10.88.2.121;
	option routers 10.88.2.1;
	option broadcast-address 10.88.2.255;
	default-lease-time 600;
}

subnet 10.88.3.0 netmask 255.255.255.0 {
	option routers 10.88.3.1;
	option broadcast-address 10.88.3.255;
	host Khamul {
		hardware ethernet 02:42:92:bc:4c:00;
		fixed-address 10.88.3.95;
	}
}

subnet 10.88.4.0 netmask 255.255.255.0 {
	option routers 10.88.4.1;
	option broadcast-address 10.88.4.255;
}

subnet 10.88.5.0 netmask 255.255.255.0 {
	option routers 10.88.5.1;
	option broadcast-address 10.88.5.255;
}
EOF

service isc-dhcp-server restart
```
| Subnet       | Pengguna   | Rentang IP            | Gateway   | Lease Time | Keterangan            |
| ------------ | ---------- | --------------------- | --------- | ---------- | --------------------- |
| 10.88.1.0/24 | Amandil    | 10.88.1.6–34, 68–94   | 10.88.1.1 | 1800 s     | DHCP dinamis          |
| 10.88.2.0/24 | Gilgalad   | 10.88.2.35–67, 96–121 | 10.88.2.1 | 600 s      | DHCP dinamis          |
| 10.88.3.0/24 | Khamul     | (fixed) 10.88.3.95    | 10.88.3.1 | -          | IP statis via MAC     |
| 10.88.4.0/24 | Relay Link | -                     | 10.88.4.1 | -          | Koneksi ke DHCP Relay |
| 10.88.5.0/24 | DNS        | -                     | 10.88.5.1 | -          | Jaringan internal DNS |

Dan agar ip dhcp dapat terforward ke subnet lain, diberikan dhcp relay sekaligus router berupa Durin.
```
cat > /etc/default/isc-dhcp-relay << EOF
SERVERS="10.88.4.2"  
INTERFACES="eth1 eth2 eth3 eth4 eth5"
OPTIONS=""
EOF

cat > /etc/sysctl.conf << EOF
net.ipv4.ip_forward=1
EOF

service isc-dhcp-relay restart
```
Aldarion
<img width="1254" height="1225" alt="image" src="https://github.com/user-attachments/assets/1886d9f2-8757-423f-94e7-04db696060ee" />

Durin
<img width="1116" height="1220" alt="image" src="https://github.com/user-attachments/assets/922dc6ee-bb03-4d47-9a97-5a9aa0a00197" />

Khamul
<img width="837" height="257" alt="image" src="https://github.com/user-attachments/assets/2f3be5a2-377a-467a-945d-e015854ee7dc" />

Gilgalad
<img width="837" height="239" alt="image" src="https://github.com/user-attachments/assets/541f04f3-8571-4655-a716-a9335e9d4d37" />

## Soal 3
Minastri
<img width="1129" height="1224" alt="image" src="https://github.com/user-attachments/assets/1f507859-c8e3-4737-ac04-f7d56db58d68" />

Erendis
<img width="1211" height="974" alt="image" src="https://github.com/user-attachments/assets/9042abf8-ef00-464f-91b5-f0263f26fb54" />

Amdir
<img width="1213" height="794" alt="image" src="https://github.com/user-attachments/assets/ca2b64a3-6561-457b-9203-bdea180f7b05" />

Gilgalad/Amandil
<img width="995" height="1257" alt="image" src="https://github.com/user-attachments/assets/3252ec32-e482-4be9-8818-fc278e8bf042" />

###
```
apt-get update && apt-get install bind9 bind9utils -y
ln -s /etc/init.d/named /etc/init.d/bind9
```
**Penjelasan**
- `apt-get install bind9 bind9utils -y` Menginstal BIND9, software server DNS yang paling umum di Linux, dan bind9utils berisi alat tambahan seperti `dig` dan `rndc`.
- `ln -s /etc/init.d/named /etc/init.d/bind9` Membuat symlink agar service bisa dijalankan dengan perintah service bind9 start/restart, karena beberapa sistem mengenal service dengan nama `named`.

```
cat > /etc/bind/named.conf.options <<'EOF'
options {
    directory "/var/cache/bind";
    dnssec-validation no;
    forwarders { 192.168.122.1; };
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
EOF
```
**Penjelasan**
- `directory "/var/cache/bind";` Lokasi cache DNS.
- `dnssec-validation no;` Mematikan DNSSEC validation agar lebih sederhana (kadang DNS lokal belum mendukung DNSSEC).
- `forwarders { 192.168.122.1; };` DNS ini akan meneruskan semua query ke DNS eksternal (192.168.122.1) jika tidak bisa menjawab secara lokal. Biasanya ini adalah DNS dari host utama atau internet gateway (NAT).
- `allow-query { any; };` Mengizinkan semua client melakukan permintaan DNS (tanpa batasan subnet).
- `auth-nxdomain no;` Mengatur agar server tidak menyatakan dirinya sebagai authoritative jika domain tidak ditemukan.
- `listen-on-v6 { any; };` Mengaktifkan DNS agar mendengarkan di semua interface IPv6.

```
cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type forward;
    forward only;
    forwarders { 10.88.3.2; 10.88.3.3; };
};
EOF
service bind9 restart
```
**Penjelasan**
- `zone "jarkomK49.com"` Mendefinisikan domain lokal yang akan dikelola.
- `type forward;` Menandakan bahwa server ini bukan authoritative, melainkan hanya meneruskan (forward) permintaan untuk domain ini ke server lain.
- `forward only;` Semua query untuk domain ini hanya akan diteruskan, dan server ini tidak akan mencoba melakukan resolve sendiri.
- `forwarders { 10.88.3.2; 10.88.3.3; };` Alamat IP server DNS utama yang menangani domain `jarkomK49.com`.
- Biasanya IP tersebut adalah DNS master dan slave (misalnya: Tirion dan Valmar).

## Soal 4
Erendis
<img width="1185" height="1224" alt="Screenshot 2025-11-01 115528" src="https://github.com/user-attachments/assets/dc5d0bdc-8969-4a7c-a524-7993a6ba02fa" />

### Instalasi & Persiapan
```bash
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y
mkdir -p /etc/bind/K49
```
**Penjelasan:**
- Mengatur nameserver sementara agar bisa melakukan `apt-get update`.
- Menginstal paket `bind9` dan `bind9utils` untuk DNS server.
- Membuat direktori penyimpanan zona `K49`.
---
### Membuat File Zona Reverse
Contoh untuk empat subnet berbeda (10.88.1.x–10.88.4.x).

```bash
cat > /etc/bind/K49/1.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@ IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
2025110115 ; Serial
604800 ; Refresh
86400 ; Retry
2419200 ; Expire
604800 ) ; Negative Cache TTL
@ IN NS ns1.jarkomK49.com.
@ IN NS ns2.jarkomK49.com.
35 IN PTR Elros.jarkomK49.com.
2 IN PTR Elendil.jarkomK49.com.
3 IN PTR Isildur.jarkomK49.com.
4 IN PTR Anarion.jarkomK49.com.
EOF
```
**Penjelasan:**
- Zona `1.88.10.in-addr.arpa` adalah representasi **reverse zone** untuk `10.88.1.x`.
- Setiap entri `PTR` memetakan alamat IP ke hostname.
Langkah yang sama dilakukan untuk subnet `10.88.2.x`, `10.88.3.x`, dan `10.88.4.x`.
---
### Konfigurasi Master Zone di `named.conf.local`
```bash
cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/jarkomK49.com";
};

zone "1.88.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/1.88.10.in-addr.arpa";
};
EOF
```
**Penjelasan:**
- `type master` berarti server ini adalah pengelola utama zona.
- `also-notify` dan `allow-transfer` memungkinkan **Amdir (slave)** menerima salinan zona secara otomatis.
---
### Validasi & Restart Service
```bash
named-checkzone 1.88.10.in-addr.arpa /etc/bind/K49/1.88.10.in-addr.arpa
named-checkconf
service bind9 restart
```
**Penjelasan:**
- Mengecek validitas file zona dan konfigurasi.
- Merestart service BIND9 untuk memuat ulang konfigurasi.
---

Amdir
<img width="1201" height="1222" alt="Screenshot 2025-11-01 115432" src="https://github.com/user-attachments/assets/da6007a0-a622-4871-9c58-f5411d268d50" />
### Instalasi & Setup
```bash
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y
mkdir -p /var/cache/bind
chown bind:bind /var/cache/bind
```
**Penjelasan:**
- Sama seperti di master, instalasi BIND9 dan persiapan direktori cache tempat file hasil transfer zona akan disimpan.
---
### Konfigurasi Slave di `named.conf.local`
```bash
cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type slave;
    file "/var/cache/bind/jarkomK49.com";
    masters { 10.88.3.2; };
};

zone "1.88.10.in-addr.arpa" {
    type slave;
    file "/var/cache/bind/1.88.10.in-addr.arpa";
    masters { 10.88.3.2; };
};
EOF
```
**Penjelasan:**
- `type slave` → server ini hanya menerima data dari master.
- `masters { 10.88.3.2; }` menunjukkan IP **Erendis (master)**.
- File zona otomatis dibuat saat sinkronisasi dari master.

---

### Validasi & Sinkronisasi
```bash
named-checkconf
service bind9 restart
ls -lh /var/cache/bind/
```
**Penjelasan:**
- Mengecek apakah konfigurasi benar.
- Setelah restart, slave akan otomatis melakukan **zone transfer** dari master.
- File hasil transfer bisa dilihat di `/var/cache/bind`.
---

Gilgalad/Amandiil
<img width="1276" height="1226" alt="image" src="https://github.com/user-attachments/assets/477bb27b-5bb6-45e1-b117-afa6a334f6db" />
## Pengujian Reverse DNS
```bash
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
nameserver 10.88.5.2
EOF
```
**Penjelasan:**  
Menambahkan DNS master dan slave sebagai resolver agar query `nslookup` diarahkan ke kedua server ini.
---
### Tes Reverse Lookup (IP → Hostname)
```bash
nslookup 10.88.1.35
nslookup 10.88.2.2
nslookup 10.88.3.2
nslookup 10.88.4.3
```
**Penjelasan:**
- Setiap perintah `nslookup` mengecek apakah alamat IP dikembalikan menjadi nama domain sesuai entri `PTR` di zona.
---
### Tes Forward Lookup (Hostname → IP)
```bash
nslookup Elros.jarkomK49.com
nslookup ns1.jarkomK49.com
```
**Penjelasan:**
- Untuk memastikan fungsi DNS dua arah berjalan (forward & reverse).
---
### Kesimpulan
Dengan konfigurasi ini:
- **Erendis (10.88.3.2)** → berperan sebagai **DNS Master** (mengelola semua zona).  
- **Amdir (10.88.3.3)** → berperan sebagai **DNS Slave** (backup otomatis melalui zone transfer).  
- Sistem mampu melakukan **resolusi dua arah (forward dan reverse lookup)**, memastikan integritas dan redundansi DNS berjalan dengan baik.

## Soal 5
Erendis
<img width="917" height="1208" alt="image" src="https://github.com/user-attachments/assets/297f990a-ea3c-4254-b279-8c2a5b8c818d" />
### Instalasi dan Persiapan
```bash
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y
mkdir -p /etc/bind/K49
```
**Penjelasan:**
- `bind9` dan `bind9utils` digunakan untuk menjalankan DNS server.
- Direktori `/etc/bind/K49` berisi semua file zona untuk domain `jarkomK49.com`.
---

### File Zona Utama (Forward Zone)
```bash
cat > /etc/bind/K49/jarkomK49.com <<'EOF'
$TTL 604800
@ IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
    2025110116 ; Serial
    604800     ; Refresh
    86400      ; Retry
    2419200    ; Expire
    604800 )   ; Negative Cache TTL

@   IN NS ns1.jarkomK49.com.
@   IN NS ns2.jarkomK49.com.

ns1 IN A 10.88.3.2
ns2 IN A 10.88.3.3

@   IN A 10.88.1.35
www IN CNAME @

Elros       IN A 10.88.1.35
www.Elros   IN CNAME Elros.jarkomK49.com.
Elendil     IN A 10.88.1.2
www.Elendil IN CNAME Elendil.jarkomK49.com.
Isildur     IN A 10.88.1.3
www.Isildur IN CNAME Isildur.jarkomK49.com.
Anarion     IN A 10.88.1.4
www.Anarion IN CNAME Anarion.jarkomK49.com.

Pharazon    IN A 10.88.2.2
www.Pharazon IN CNAME Pharazon.jarkomK49.com.
Galadriel   IN A 10.88.2.6
www.Galadriel IN CNAME Galadriel.jarkomK49.com.
Celeborn    IN A 10.88.2.5
www.Celeborn IN CNAME Celeborn.jarkomK49.com.
Oropher     IN A 10.88.2.4
www.Oropher IN CNAME Oropher.jarkomK49.com.

Palantir    IN A 10.88.4.3
www.Palantir IN CNAME Palantir.jarkomK49.com.

Elros       IN TXT "Cincin Sauron"
Pharazon    IN TXT "Aliansi Terakhir"
EOF
```
**Penjelasan:**
- Menyimpan semua **A Record**, **CNAME (www alias)**, dan **TXT record** untuk domain utama.
- TXT berfungsi menyimpan informasi tambahan (“pesan rahasia”).
---

### File Reverse Zone
Contoh untuk subnet `10.88.1.0/24`:
```bash
cat > /etc/bind/K49/1.88.10.in-addr.arpa <<'EOF'
$TTL 604800
@ IN SOA ns1.jarkomK49.com. root.jarkomK49.com. (
    2025110116
    604800
    86400
    2419200
    604800 )
@ IN NS ns1.jarkomK49.com.
@ IN NS ns2.jarkomK49.com.

35 IN PTR Elros.jarkomK49.com.
2  IN PTR Elendil.jarkomK49.com.
3  IN PTR Isildur.jarkomK49.com.
4  IN PTR Anarion.jarkomK49.com.
EOF
```
**Penjelasan:** Reverse zone menghubungkan alamat IP ke nama domain (PTR Record).
---

### Konfigurasi Zona di `named.conf.local`
```bash
cat > /etc/bind/named.conf.local <<'EOF'
zone "jarkomK49.com" {
    type master;
    notify yes;
    also-notify { 10.88.3.3; };
    allow-transfer { 10.88.3.3; };
    file "/etc/bind/K49/jarkomK49.com";
};
EOF
```
**Penjelasan:**
- `type master` → server utama pengelola zona.
- `allow-transfer` → mengizinkan slave (10.88.3.3) menarik data zona.
- `notify yes` → memberi tahu slave saat ada pembaruan.
---

### Pemeriksaan dan Restart
```bash
named-checkzone jarkomK49.com /etc/bind/K49/jarkomK49.com
named-checkconf
service bind9 restart
```
**Penjelasan:**
- Mengecek sintaks file zona dan konfigurasi global.
- Me-restart BIND agar konfigurasi aktif.
---

Amdir
<img width="893" height="677" alt="image" src="https://github.com/user-attachments/assets/8439b754-4ad9-428e-840b-b7e048360656" />
```bash
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update && apt-get install bind9 bind9utils -y

mkdir -p /var/cache/bind
chown bind:bind /var/cache/bind

cat > /etc/bind/named.conf.local <<EOF
zone "jarkomK49.com" {
    type slave;
    file "/var/cache/bind/jarkomK49.com";
    masters { 10.88.3.2; };
};
EOF

service bind9 restart
```
**Penjelasan:**
- `type slave` → menerima data dari master (Erendis).
- File zona otomatis tersimpan di `/var/cache/bind/`.
- Slave memperbarui otomatis setiap kali master berubah.
---

Gilgalad atau Amandil
<img width="983" height="1149" alt="image" src="https://github.com/user-attachments/assets/b78f633e-dc46-4f42-9fab-9d8726327d8d" />

<img width="883" height="953" alt="image" src="https://github.com/user-attachments/assets/d3f9a03c-327a-47fa-b04a-e683b7d1da4b" />

<img width="881" height="966" alt="image" src="https://github.com/user-attachments/assets/d4d80deb-3ab7-4121-9699-94b314e88709" />
### Setting Resolver
```bash
cat > /etc/resolv.conf <<EOF
nameserver 10.88.3.2
nameserver 10.88.3.3
EOF
```

### Pengujian Forward Lookup (A & CNAME)
```bash
nslookup www.jarkomK49.com
nslookup www.Elros.jarkomK49.com
nslookup www.Pharazon.jarkomK49.com
```

### Pengujian TXT Record
```bash
nslookup -type=TXT Elros.jarkomK49.com
nslookup -type=TXT Pharazon.jarkomK49.com
```

### Pengujian Reverse Lookup
```bash
nslookup 10.88.1.35
nslookup 10.88.2.2
```
**Penjelasan:**
- **A & CNAME test** memastikan domain utama dan alias terhubung benar.
- **TXT test** menunjukkan data tambahan yang disimpan pada DNS.
- **Reverse test (PTR)** mengonfirmasi bahwa IP berhasil diterjemahkan kembali menjadi nama domain.
---
### Hasil Akhir
✅ Master–Slave sinkronisasi berjalan  
✅ Alias `www` aktif di semua domain  
✅ TXT records “Cincin Sauron” & “Aliansi Terakhir” tersimpan  
✅ Reverse DNS berfungsi untuk semua subnet  

## Soal 6
Gilgalad
<img width="803" height="711" alt="image" src="https://github.com/user-attachments/assets/7788a427-f19a-408c-a7c1-f853fa85bb04" />

Amandil
<img width="806" height="400" alt="image" src="https://github.com/user-attachments/assets/12c4fce4-b382-4228-afe5-e9e371edd5a2" />

### File `/var/lib/dhcp/dhcpd.leases`
- File ini digunakan oleh DHCP server (misalnya ISC-DHCP) untuk menyimpan data tentang IP yang sudah diberikan (leased) ke klien.
- Setiap kali ada perangkat (client) yang mendapatkan IP lewat DHCP, server mencatat:
  - IP address yang diberikan
  - MAC address client
  - Waktu mulai dan berakhirnya lease
  - Status lease (active, expired, released, dll.)

## Soal 7

### Laravel Worker Setup (Elendil, Isildur, Anarion)
Script ini digunakan untuk mengkonfigurasi **Laravel Worker** di node **Elendil**, **Isildur**, dan **Anarion**.
Masing-masing worker akan menjalankan **Nginx + PHP-FPM + Laravel App** dan diakses oleh klien (Amandil/Gilgalad).

---
### 1. Struktur Utama Script

Elendil
<img width="1131" height="920" alt="image" src="https://github.com/user-attachments/assets/03d96cd7-ce59-41af-918e-9bd0efffe944" />

Isildur
<img width="1007" height="910" alt="image" src="https://github.com/user-attachments/assets/170999cc-acd9-41e1-9e43-031468fa5edb" />

Anarion
<img width="1024" height="904" alt="image" src="https://github.com/user-attachments/assets/801fc543-b4b9-4f5f-b927-7e8dfb45e80c" />

```bash
#!/bin/bash

setup_laravel_worker() {
    HOSTNAME=$(hostname | tr '[:lower:]' '[:upper:]')
    IP=$(hostname -I | awk '{print $1}')
    ...
}
setup_laravel_worker "$HOSTNAME" "$IP"
```
Fungsi `setup_laravel_worker()` digunakan agar konfigurasi bisa dijalankan pada beberapa node sekaligus.
* `hostname` → mengambil nama host (misal: elendil)
* `tr '[:lower:]' '[:upper:]'` → ubah ke huruf besar
* `hostname -I` → ambil IP lokal yang digunakan node

---
### 2. Menyiapkan DNS dan Repository PHP
```bash
echo "nameserver 192.168.122.1" > /etc/resolv.conf

apt update -y
apt install -y lsb-release ca-certificates apt-transport-https curl gnupg

curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/php.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
```
Bagian ini:
* Mengatur DNS sementara ke `192.168.122.1`
* Menambahkan repository **PHP Sury** agar bisa menginstal versi PHP terbaru (`8.4`)

---
### 3. Instalasi Dependensi
```bash
apt update -y
apt install -y php8.4 php8.4-fpm php8.4-mysql php8.4-xml php8.4-curl \
               php8.4-mbstring php8.4-zip php8.4-gd php8.4-cli composer nginx git unzip

service php8.4-fpm restart
```
Menginstal seluruh komponen yang dibutuhkan Laravel:
* **PHP-FPM** untuk menjalankan aplikasi
* **Composer** untuk dependency management
* **Nginx** untuk web server
* **Git + Unzip** untuk clone project Laravel dari GitHub

---
### 4. Clone Project Laravel
```bash
rm -rf /var/www/laravel
cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git laravel
cd laravel

composer update --no-interaction --prefer-dist --optimize-autoloader || composer install --no-interaction

cp .env.example .env
php artisan key:generate
```
Langkah ini:
* Menghapus folder Laravel lama
* Clone repository Laravel dari GitHub
* Menginstal dependency melalui **Composer**
* Membuat file `.env` dan **generate application key**

---
### 5. Atur Hak Akses Folder
```bash
chown -R www-data:www-data /var/www/laravel
chmod -R 755 /var/www/laravel/storage
```
Memberikan hak akses ke user `www-data` (default Nginx & PHP-FPM) agar Laravel bisa menyimpan log/cache di folder `storage`.

---
### 6. Konfigurasi Nginx
```bash
cat > /etc/nginx/sites-available/laravel <<'EOF'
server {
    listen 80;
    server_name _;

    root /var/www/laravel/public;
    index index.php index.html;

    access_log /var/log/nginx/access.log;
    error_log  /var/log/nginx/error.log;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

ln -sf /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/laravel
rm -f /etc/nginx/sites-enabled/default

service php8.4-fpm restart
service nginx restart
```
Menentukan konfigurasi server Laravel:
* Root folder: `/var/www/laravel/public`
* PHP-FPM socket: `/var/run/php/php8.4-fpm.sock`
* Menghapus konfigurasi default Nginx
* Restart service agar konfigurasi baru aktif

---
### 7. Output Akhir per Node
```bash
echo "✅ $HOSTNAME siap diakses di http://$IP"
```
Menampilkan hasil akhir bahwa node Laravel sudah siap diakses melalui browser.

---
### 8. Testing dari Client (Amandil atau Gilgalad)

<img width="1024" height="884" alt="image" src="https://github.com/user-attachments/assets/3567ed89-bf6b-471d-ae46-e6a2b21022c1" />

```bash
apt install -y lynx -y

for IP in 10.88.1.2 10.88.1.3 10.88.1.4; do
    echo
    echo "=== Uji koneksi Laravel Worker ($IP) ==="
    lynx -dump http://$IP | head -n 10 || echo "Gagal mengakses $IP"
done
```
Testing dilakukan dengan `lynx`, browser berbasis terminal:
* Mengakses semua Laravel worker (Elendil, Isildur, Anarion)
* Menampilkan 10 baris pertama dari halaman utama aplikasi Laravel

---
### 9. Hasil Akhir
```
==========================================
 SEMUA WORKER BERHASIL DIUJI!
==========================================
✅ Semua node Laravel aktif
✅ Nginx dan PHP-FPM berjalan
✅ Laravel REST API berhasil dideploy di ketiga node
```

---
### Kesimpulan
| Node                   | Fungsi           | IP        | Service          |
| ---------------------- | ---------------- | --------- | ---------------- |
| **Elendil**            | Laravel Worker 1 | 10.88.1.2 | PHP + Nginx      |
| **Isildur**            | Laravel Worker 2 | 10.88.1.3 | PHP + Nginx      |
| **Anarion**            | Laravel Worker 3 | 10.88.1.4 | PHP + Nginx      |
| **Amandil / Gilgalad** | Client           | DHCP      | Testing via Lynx |

## Soal 8

### Palantir Database & Laravel Integration Setup
Dokumen ini menjelaskan konfigurasi **Palantir** sebagai **database server (MariaDB/MySQL)** dan cara menghubungkan **Laravel Worker** (Elendil, Isildur, Anarion) ke database tersebut.

---
### 1. Konfigurasi Palantir (Database Server)

<img width="982" height="761" alt="image" src="https://github.com/user-attachments/assets/657d2379-a5fa-454c-86fc-25730bff2e4f" />

```bash
echo "=========================================="
echo "       [PALANTIR] - MySQL Database"
echo "=========================================="

apt update -y
apt install -y mariadb-server
service mariadb start
```
Menginstal dan menjalankan MariaDB di Palantir sebagai pusat database untuk semua worker.

---
### Membuat Database dan User
```bash
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS laravel;
CREATE USER IF NOT EXISTS 'k49'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON laravel.* TO 'k49'@'%';
FLUSH PRIVILEGES;
EOF
```
Penjelasan:
* `CREATE DATABASE laravel` → membuat database utama yang akan digunakan aplikasi Laravel.
* `CREATE USER 'k49'@'%' IDENTIFIED BY '123456'` → membuat user yang bisa diakses dari mana saja (`%` berarti semua IP).
* `GRANT ALL PRIVILEGES` → memberikan akses penuh ke database `laravel`.
* `FLUSH PRIVILEGES` → menyegarkan hak akses agar langsung berlaku.

---
### Mengizinkan Koneksi dari Luar
```bash
sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb restart
```
Mengganti konfigurasi default MariaDB agar menerima koneksi dari semua IP, bukan hanya `localhost`.

---
### Verifikasi Database Siap
```bash
wait_for_db() {
  echo "Menunggu Palantir siap..."
  until mysql -h10.88.4.3 -uk49 -p123456 -e "SELECT 1;" &> /dev/null; do
    sleep 2
  done
  echo "✅ Palantir siap menerima koneksi!"
}
wait_for_db
```
Looping sederhana untuk memastikan database benar-benar aktif dan dapat diakses dari jaringan sebelum lanjut ke konfigurasi worker.

---
### 2. Konfigurasi Laravel Worker (Elendil, Isildur, Anarion)

Elendil
<img width="1190" height="1169" alt="image" src="https://github.com/user-attachments/assets/d83acbe1-3579-477b-87b5-71fc4a940409" />

Isildur
<img width="1039" height="866" alt="image" src="https://github.com/user-attachments/assets/804f0619-97b2-43f6-a699-037e66c7aade" />

Anarion
<img width="992" height="866" alt="image" src="https://github.com/user-attachments/assets/72709ced-bfc5-456f-bb67-9af8e579bd04" />

```bash
setup_worker() {
    WORKER_NAME=$1
    WORKER_IP=$2
    WORKER_PORT=$3
    LOG_FILE="/tmp/${WORKER_NAME}.log"
    ...
}
```
Fungsi ini otomatis men-setup setiap worker agar terkoneksi dengan database **Palantir** dan memiliki port unik masing-masing.

---
### Mengatur Environment Laravel
```bash
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
EOF
```
Isi file `.env` menentukan koneksi database Laravel ke Palantir:
* Host DB: `10.88.4.3`
* User: `k49`
* Password: `123456`
* Database: `laravel`

---
### Konfigurasi Nginx per Worker
```bash
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
```
Penjelasan:
* Setiap worker berjalan pada port unik (`8001`, `8002`, `8003`).
* Domain internal: `elendil.laravel.com`, `isildur.laravel.com`, `anarion.laravel.com`.
* Request langsung ke IP akan ditolak (`return 444`) — hanya domain yang diterima.

---
### Deploy dan Migrasi
```bash
php artisan migrate:fresh --seed | tee /tmp/migrate.log
```
Menjalankan migrasi dan seed database di worker **Elendil** untuk menyiapkan struktur tabel dan data awal.

---
### 3. Testing Domain dan IP
### Tambahkan Host Mapping
```bash
echo "10.88.1.2 elendil.laravel.com" >> /etc/hosts
echo "10.88.1.3 isildur.laravel.com" >> /etc/hosts
echo "10.88.1.4 anarion.laravel.com" >> /etc/hosts
```
Agar client (Amandil/Gilgalad) dapat mengenali domain internal masing-masing worker.

---
### Tes Akses dari Client
```bash
lynx -dump http://elendil.laravel.com:8001 | head -n 10
lynx -dump http://isildur.laravel.com:8002 | head -n 10
lynx -dump http://anarion.laravel.com:8003 | head -n 10
```
* Akses via **domain** → harus berhasil.
* Akses via **IP langsung** (`curl -I http://10.88.1.x`) → ditolak sesuai konfigurasi Nginx.

---
### 4. Hasil Akhir

<img width="1110" height="1113" alt="image" src="https://github.com/user-attachments/assets/2bda7c1a-1e27-4c32-ad2f-ac7e79ac4af9" />

```
==========================================
✅ SEMUA WORKER TERKONFIGURASI
✅ DATABASE TERHUBUNG KE PALANTIR
✅ MIGRASI LARAVEL BERHASIL
==========================================
```

---
### Kesimpulan
| Komponen               | Hostname | IP        | Fungsi                     |
| ---------------------- | -------- | --------- | -------------------------- |
| **Palantir**           | palantir | 10.88.4.3 | MariaDB Server             |
| **Elendil**            | elendil  | 10.88.1.2 | Laravel Worker (port 8001) |
| **Isildur**            | isildur  | 10.88.1.3 | Laravel Worker (port 8002) |
| **Anarion**            | anarion  | 10.88.1.4 | Laravel Worker (port 8003) |
| **Amandil / Gilgalad** | client   | DHCP      | Testing Domain dan Koneksi |

---

## Soal 9
### Testing Individual Laravel Workers
Script ini digunakan untuk **mengujikan konektivitas dan fungsionalitas Laravel Worker** satu per satu (Elendil, Isildur, dan Anarion).
Testing dilakukan melalui **domain internal dan port spesifik** untuk memastikan setiap worker dapat menampilkan halaman utama serta endpoint API `/api/airing`.

<img width="1076" height="1104" alt="image" src="https://github.com/user-attachments/assets/d6cacc4c-ef81-48fb-9833-7bba910f9aa9" />

---
### 1. Struktur Utama Script
```bash
#!/bin/bash
echo "=========================================="
echo "      TESTING INDIVIDUAL WORKERS"
echo "=========================================="
echo ""
```
Bagian pembuka menampilkan header dan mempersiapkan proses testing untuk setiap worker.

---
### 2. Instalasi Tools Testing
```bash
apt-get update -y
apt-get install -y lynx curl
```
Menginstal
* **lynx** → browser berbasis teks untuk menampilkan halaman web di terminal
* **curl** → alat untuk mengakses API REST

Keduanya digunakan untuk memverifikasi apakah Laravel Worker berjalan dan bisa diakses melalui domain.

---
### 3. Daftar Worker yang Diuji
```bash
WORKERS=(
    "elendil.laravel.com:8001"
    "isildur.laravel.com:8002"
    "anarion.laravel.com:8003"
)
```
Tiga worker Laravel dengan domain dan port unik:
| Worker  | Domain              | Port | IP        |
| ------- | ------------------- | ---- | --------- |
| Elendil | elendil.laravel.com | 8001 | 10.88.1.2 |
| Isildur | isildur.laravel.com | 8002 | 10.88.1.3 |
| Anarion | anarion.laravel.com | 8003 | 10.88.1.4 |

---
### 4. Loop Testing Setiap Worker
```bash
for w in "${WORKERS[@]}"; do
    NAME=$(echo $w | cut -d. -f1)
    PORT=$(echo $w | cut -d: -f2)
    DOMAIN=$(echo $w | cut -d: -f1-2)
    ...
done
```
Script akan **melakukan iterasi otomatis** untuk setiap worker dalam daftar `WORKERS`:
* `NAME` → nama worker (misal: elendil)
* `PORT` → port yang digunakan (8001, 8002, 8003)
* `DOMAIN` → domain lengkap worker

---
### 5. Pengujian Halaman Utama Laravel
```bash
echo ">>> Halaman utama"
lynx -dump http://$w | head -n 10 || echo "[!] Gagal mengakses halaman utama $NAME"
```
* Mengakses halaman utama Laravel (`/`) via domain.
* Menampilkan 10 baris pertama hasil HTML.
* Jika gagal, akan muncul pesan peringatan.

---
### 6. Pengujian API Endpoint `/api/airing`
```bash
echo ">>> API /api/airing"
curl -s http://$w/api/airing || echo "[!] Gagal mengakses API $NAME"
```
Menggunakan `curl` untuk mengakses API Laravel:
* Endpoint: `/api/airing`
* Hasil berupa JSON (misalnya daftar data dari seeding)
* Jika API tidak merespons, script akan memberi tanda gagal untuk worker tersebut.

---
### 7. Output Akhir
```bash
echo "✅ Semua worker berhasil dites via domain!"
echo "=========================================="
```
Menandakan semua pengujian selesai dan berhasil dijalankan.

---
### Hasil Akhir
| Tes                   | Deskripsi                                     | Hasil                               |
| --------------------- | --------------------------------------------- | ----------------------------------- |
| Halaman utama Laravel | Akses `http://<domain>:<port>`                | ✅ Berhasil menampilkan teks Laravel |
| API `/api/airing`     | Akses endpoint API                            | ✅ Mengembalikan data JSON           |
| Koneksi via domain    | Resolusi DNS internal berfungsi               | ✅ Sukses                            |
| Port unik             | Tiap worker hanya aktif di port masing-masing | ✅ Tidak ada konflik                 |

---
### Kesimpulan
Script ini memastikan bahwa:
* Semua **Laravel Worker** aktif dan berfungsi dengan benar.
* **Domain internal dan port** dapat diakses oleh client.
* API endpoint dari masing-masing worker berjalan tanpa error.

---

## Soal 10

## Soal 11

## Soal 12

## Soal 13

## Soal 14

## Soal 15
