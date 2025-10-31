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

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx php8.4-fpm composer -y
```

**Isildur**
```
auto eth0
iface eth0 inet static
	address 10.88.1.3
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx php8.4-fpm composer -y
```

**Anarion**
```
auto eth0
iface eth0 inet static
	address 10.88.1.4
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx php8.4-fpm composer -y
```

**Miriel**
```
auto eth0
iface eth0 inet static
	address 10.88.1.5
	netmask 255.255.255.0
	gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install lynx curl -y
```

**Celebrimbor**
```
auto eth0
iface eth0 inet static
	address 10.88.2.3
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install lynx curl -y
```

**Elros**
```
auto eth0
iface eth0 inet static
    address 10.88.1.10 
    netmask 255.255.255.0
    gateway 10.88.1.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx apache2-utils lynx curl -y
```

**Pharazon**
```
auto eth0
iface eth0 inet static
	address 10.88.2.2
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx apache2-utils lynx curl -y
```

**Galadriel**
```
auto eth0
iface eth0 inet static
	address 10.88.2.6
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx php8.4-fpm -y
```

**Celeborn**
```
auto eth0
iface eth0 inet static
	address 10.88.2.5
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx php8.4-fpm -y
```

**Oropher**
```
auto eth0
iface eth0 inet static
	address 10.88.2.4
	netmask 255.255.255.0
	gateway 10.88.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update
up apt-get install nginx php8.4-fpm -y
```

**Erendis**
```
auto eth0
iface eth0 inet static
	address 10.88.3.2
	netmask 255.255.255.0
	gateway 10.88.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install bind9 -y
up ln -s /etc/init.d/named /etc/init.d/bind9
up mkdir -p /etc/bind/jarkomK49
```

**Amdir**
```
auto eth0
iface eth0 inet static
	address 10.88.3.3
	netmask 255.255.255.0
	gateway 10.88.3.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install bind9 -y
up ln -s /etc/init.d/named /etc/init.d/bind9
```

**Aldarion**
```
auto eth0
iface eth0 inet static
    address 10.88.4.2
    netmask 255.255.255.0
    gateway 10.88.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install isc-dhcp-server -y
```

**Palantir**
```
auto eth0
iface eth0 inet static
	address 10.88.4.3
	netmask 255.255.255.0
	gateway 10.88.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install mariadb-server -y
```

**Narvi**
```
auto eth0
iface eth0 inet static
	address 10.88.4.4
	netmask 255.255.255.0
	gateway 10.88.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install mariadb-server -y
```

**Minastir**
```
auto eth0
iface eth0 inet static
	address 10.88.5.2
	netmask 255.255.255.0
	gateway 10.88.5.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install bind9 nginx -y
```

**Gilgalad**
```
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install lynx curl -y
```

**Amandil**
```
auto eth0
iface eth0 inet dhcp

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install lynx curl -y
```

**Khamul**
```
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

hwaddress ether 02:42:92:bc:4c:00

up echo nameserver 192.168.122.1 > /etc/resolv.conf
up apt-get update && apt-get install lynx curl -y
```

## Soal 2

## Soal 3

## Soal 4

## Soal 5

## Soal 6

## Soal 7

## Soal 8

## Soal 9

## Soal 10
