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
16. [Soal 16](#Soal-16)
17. [Soal 17](#Soal-17)
18. [Soal 18](#Soal-18)
19. [Soal 19](#Soal-19)
20. [Soal 20](#Soal-20)

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

up apt-get update -y
up apt-get install iptables isc-dhcp-relay -y
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
up sysctl net.ipv4.ip_forward=1
up echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
up service isc-dhcp-relay restart
# DHCP_SERVERS="10.88.4.2"
# INTERFACES="eth1 eth2 eth3 eth4 eth5"
```

**Elendil**
```
auto eth0
iface eth0 inet static
	address 10.88.1.2
	netmask 255.255.255.0
	gateway 10.88.1.1
```

**Isildur**
```
auto eth0
iface eth0 inet static
	address 10.88.1.3
	netmask 255.255.255.0
	gateway 10.88.1.1
```

**Anarion**
```
auto eth0
iface eth0 inet static
	address 10.88.1.4
	netmask 255.255.255.0
	gateway 10.88.1.1
```

**Miriel**
```
auto eth0
iface eth0 inet static
	address 10.88.1.5
	netmask 255.255.255.0
	gateway 10.88.1.1
```

**Celebrimbor**
```
auto eth0
iface eth0 inet static
	address 10.88.2.3
	netmask 255.255.255.0
	gateway 10.88.2.1
```

**Elros**
```
auto eth0
iface eth0 inet static
    address 10.88.1.10 
    netmask 255.255.255.0
    gateway 10.88.1.1
```

**Pharazon**
```
auto eth0
iface eth0 inet static
	address 10.88.2.2
	netmask 255.255.255.0
	gateway 10.88.2.1
```

**Galadriel**
```
auto eth0
iface eth0 inet static
	address 10.88.2.6
	netmask 255.255.255.0
	gateway 10.88.2.1
```

**Celeborn**
```
auto eth0
iface eth0 inet static
	address 10.88.2.5
	netmask 255.255.255.0
	gateway 10.88.2.1
```

**Oropher**
```
auto eth0
iface eth0 inet static
	address 10.88.2.4
	netmask 255.255.255.0
	gateway 10.88.2.1
```

**Erendis**
```
auto eth0
iface eth0 inet static
	address 10.88.3.2
	netmask 255.255.255.0
	gateway 10.88.3.1
```

**Amdir**
```
auto eth0
iface eth0 inet static
	address 10.88.3.3
	netmask 255.255.255.0
	gateway 10.88.3.1
```

**Aldarion**
```
auto eth0
iface eth0 inet static
    address 10.88.4.2
    netmask 255.255.255.0
    gateway 10.88.4.1
```

**Palantir**
```
auto eth0
iface eth0 inet static
	address 10.88.4.3
	netmask 255.255.255.0
	gateway 10.88.4.1
```

**Narvi**
```
auto eth0
iface eth0 inet static
	address 10.88.4.4
	netmask 255.255.255.0
	gateway 10.88.4.1
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
```

**Amandil**
```
auto eth0
iface eth0 inet dhcp
```

**Khamul**
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

hwaddress ether 02:42:92:bc:4c:00
```

## Soal 2

Aldarion
<img width="1254" height="1225" alt="image" src="https://github.com/user-attachments/assets/1886d9f2-8757-423f-94e7-04db696060ee" />

Durin
<img width="1116" height="1220" alt="image" src="https://github.com/user-attachments/assets/922dc6ee-bb03-4d47-9a97-5a9aa0a00197" />

Khamul
<img width="837" height="257" alt="image" src="https://github.com/user-attachments/assets/2f3be5a2-377a-467a-945d-e015854ee7dc" />

Gilgalad
<img width="837" height="239" alt="image" src="https://github.com/user-attachments/assets/541f04f3-8571-4655-a716-a9335e9d4d37" />

## Soal 3

## Soal 4

## Soal 5

## Soal 6

## Soal 7

## Soal 8

## Soal 9

## Soal 10
