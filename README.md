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

Durin
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

up apt update -y && apt install iptables -y
up apt-get update && apt-get install isc-dhcp-relay -y
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
up service isc-dhcp-relay start
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
