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


Amdir
<img width="1201" height="1222" alt="Screenshot 2025-11-01 115432" src="https://github.com/user-attachments/assets/da6007a0-a622-4871-9c58-f5411d268d50" />

Gilgalad/Amandiil
<img width="1276" height="1226" alt="image" src="https://github.com/user-attachments/assets/477bb27b-5bb6-45e1-b117-afa6a334f6db" />

## Soal 5
Erendis
<img width="917" height="1208" alt="image" src="https://github.com/user-attachments/assets/297f990a-ea3c-4254-b279-8c2a5b8c818d" />

Amdir
<img width="893" height="677" alt="image" src="https://github.com/user-attachments/assets/8439b754-4ad9-428e-840b-b7e048360656" />

Gilgalad atau Amandil
<img width="983" height="1149" alt="image" src="https://github.com/user-attachments/assets/b78f633e-dc46-4f42-9fab-9d8726327d8d" />

<img width="883" height="953" alt="image" src="https://github.com/user-attachments/assets/d3f9a03c-327a-47fa-b04a-e683b7d1da4b" />

<img width="881" height="966" alt="image" src="https://github.com/user-attachments/assets/d4d80deb-3ab7-4121-9699-94b314e88709" />

## Soal 6
Aldarion
<img width="859" height="600" alt="image" src="https://github.com/user-attachments/assets/e49f41ef-c66c-4eef-8094-9c765db3e34b" />

Gilgalad
<img width="803" height="711" alt="image" src="https://github.com/user-attachments/assets/7788a427-f19a-408c-a7c1-f853fa85bb04" />

Amandil
<img width="806" height="400" alt="image" src="https://github.com/user-attachments/assets/12c4fce4-b382-4228-afe5-e9e371edd5a2" />

Aldarion
<img width="917" height="974" alt="image" src="https://github.com/user-attachments/assets/e9850b56-21d8-4cf4-be5b-e1dff2d69de0" />


## Soal 7

## Soal 8

## Soal 9

## Soal 10

## Soal 11

## Soal 12

## Soal 13

## Soal 14

## Soal 15
