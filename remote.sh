#!/bin/bash

MYIP=$(wget -qO- ipv4.icanhazip.com);

MYIP1=$(wget -qO- prem1.ffast-freenetph.com/ip.php);
MYIP2=$(wget -qO- prem2.ffast-freenetph.com/ip.php);
MYIP3=$(wget -qO- prem3.ffast-freenetph.com/ip.php);
MYIP4=$(wget -qO- prem4.ffast-freenetph.com/ip.php);
MYIP5=$(wget -qO- prem5.ffast-freenetph.com/ip.php);
MYIP6=$(wget -qO- prem6.ffast-freenetph.com/ip.php);

MYIP7=$(wget -qO- vip1.ffast-freenetph.com/ip.php);
MYIP8=$(wget -qO- vip2.ffast-freenetph.com/ip.php);
MYIP9=$(wget -qO- vip3.ffast-freenetph.com/ip.php);
MYIP10=$(wget -qO- vip4.ffast-freenetph.com/ip.php);
MYIP11=$(wget -qO- vip5.ffast-freenetph.com/ip.php);
MYIP12=$(wget -qO- vip6.ffast-freenetph.com/ip.php);

MYIP13=$(wget -qO- priv1.ffast-freenetph.com/ip.php);
MYIP14=$(wget -qO- priv2.ffast-freenetph.com/ip.php);
MYIP15=$(wget -qO- priv3.ffast-freenetph.com/ip.php);
MYIP16=$(wget -qO- priv4.ffast-freenetph.com/ip.php);
MYIP17=$(wget -qO- priv5.ffast-freenetph.com/ip.php);
MYIP18=$(wget -qO- priv6.ffast-freenetph.com/ip.php);

MYIP19=$(wget -qO- free.pandafreevpn.ml/ip.php);


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
acl outbound dst $MYIP7/32
acl outbound dst $MYIP8/32
acl outbound dst $MYIP9/32
acl outbound dst $MYIP10/32
acl outbound dst $MYIP11/32
acl outbound dst $MYIP12/32
acl outbound dst $MYIP13/32
acl outbound dst $MYIP14/32
acl outbound dst $MYIP15/32
acl outbound dst $MYIP16/32
acl outbound dst $MYIP17/32
acl outbound dst $MYIP18/32
acl outbound dst $MYIP19/32
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
rm remote.sh
rm -rf ~/.bash_history && history -c && history -w
clear
