#!/bin/bash

MYIP=$(wget -qO- ipv4.icanhazip.com);

MYIP1=$(wget -qO- prem1.ffast-freenetph.com/ip.php);
MYIP2=$(wget -qO- vip1.ffast-freenetph.com/ip.php);
MYIP3=$(wget -qO- vip4.ffast-freenetph.com/ip.php);
MYIP4=$(wget -qO- priv1.ffast-freenetph.com/ip.php);
MYIP5=$(wget -qO- prem4.pandafreevpn.ml/ip.php);
MYIP6=$(wget -qO- priv4.pandafreevpn.ml/ip.php);


cat << EOF > /etc/squid/squid.conf
acl Denied_ports port 1195-65535
http_access deny Denied_ports
acl to_vpn dst $MYIP
http_access allow to_vpn
acl inbound src all
acl outbound dst $MYIP/32
acl outbound dst $MYIP1/32
acl outbound dst $MYIP2/32
acl outbound dst $MYIP3/32
acl outbound dst $MYIP4/32
acl outbound dst $MYIP5/32
acl outbound dst $MYIP6/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 8989 transparent
http_port 53 transparent
http_port 8888 transparent
http_port 3218 transparent
http_port 113 transparent
visible_hostname ReyLuarJr
cache_mgr PandaTeam
EOF

service squid restart
service openvpn restart
rm panda.sh
rm -rf ~/.bash_history && history -c && history -w
clear
