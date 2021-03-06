#!/bin/sh
# if there is no rule, add rules to nat table on POSTROUTING chan that nat source ip adrr 192.168.16.0/24 to internet
iptables -C POSTROUTING -t nat -s 192.168.16.0/24 -j MASQUERADE || iptables -A POSTROUTING -t nat -s 192.168.16.0/24 -j MASQUERADE
# #allow data packge from ppp0(my client) interface to 192.168.31.0/24(my router lan)
# iptables -t filter -C FORWARD -i ppp0 -d 192.168.31.0/24 -j ACCEPT || iptables -t filter -A FORWARD -i ppp0 -d 192.168.31.0/24 -j ACCEPT
# #disable data packge from ppp+(others client) interface to 192.168.31.0/24(my router lan)
# iptables -t filter -C FORWARD -i ppp+ -d 192.168.31.0/24 -j REJECT || iptables -t filter -A FORWARD -i ppp+ -d 192.168.31.0/24 -j REJECT
# #allow data packge from ppp0(my client) interface to 192.168.125.0/24(my router lan)
# iptables -t filter -C FORWARD -i ppp0 -d 192.168.125.0/24 -j ACCEPT || iptables -t filter -A FORWARD -i ppp0 -d 192.168.125.0/24 -j ACCEPT
# #disable data packge from ppp+(others client) interface to 192.168.125.0/24(my router lan)
# iptables -t filter -C FORWARD -i ppp+ -d 192.168.125.0/24 -j REJECT || iptables -t filter -A FORWARD -i ppp+ -d 192.168.125.0/24 -j REJECT
# #disable data packge from ppp+ interface to 192.168.16.0/24(ppp+ device ip lan)
# iptables -t filter -C INPUT -i ppp+ -j DROP || iptables -t filter -A INPUT -i ppp+ -j REJECT

#allow data packge from (my client ip) interface to 192.168.31.0/24(my router lan)
iptables -t filter -C FORWARD -s 192.168.16.200 -d 192.168.0.0/16 -j ACCEPT || iptables -t filter -A FORWARD -s 192.168.16.200 -d 192.168.0.0/16 -j ACCEPT
#disable data packge from ppp+(others client) interface to 192.168.31.0/24(my router lan)
iptables -t filter -C FORWARD -i ppp+           -d 192.168.0.0/16 -j REJECT || iptables -t filter -A FORWARD -i ppp+ -d 192.168.0.0/16 -j REJECT
#disable data packge from ppp+ interface to 192.168.16.0/24(ppp+ device ip lan)
iptables -t filter -C INPUT -i ppp+ -j DROP || iptables -t filter -A INPUT -i ppp+ -j REJECT
