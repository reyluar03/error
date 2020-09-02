#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);

#set localtime
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

# installing 
wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6-8.noarch.rpm
yum install unzip -y
yum update -y
yum install php php-pdo php-mysqli php-mysql php-gd php-mbstring.x86_64 -y
yum install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel -y

rm /etc/sysctl.conf

# get file
wget -O /etc/premium.zip "https://raw.githubusercontent.com/reyluar03/pandavpnpro/master/centos6/free.zip"
cd /etc/
unzip premium.zip
cd
wget -O /var/var.zip "https://raw.githubusercontent.com/reyluar03/pandavpnpro/master/centos6/var.zip"
cd /var/
unzip var.zip
cd

sysctl -p
yum install mysql-server  dos2unix  nano squid openvpn easy-rsa httpd -y
cd /etc/openvpn/login
dos2unix auth_vpn
chmod 755 auth_vpn
cd /etc/openvpn/
chmod 755 disconnect.sh
chmod 755 connect.sh

echo "acl Denied_ports port 1195-65535
http_access deny Denied_ports
acl to_vpn dst $MYIP
http_access allow to_vpn
acl inbound src all
acl outbound dst $MYIP/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 53 transparent
http_port 8888 transparent
visible_hostname ReyLuarJr
cache_mgr ReyLuarJr"| sudo tee /etc/squid/squid.conf	


sudo /sbin/iptables -L -nsudo /sbin/iptables -L -n
 sudo /sbin/iptables -L -n
 /sbin/iptables -L -n
 /etc/init.d/iptables save
   /etc/init.d/iptables stop
   iptables -F
   iptables -X
   iptables -t nat -F
   iptables -t nat -X
   iptables -t mangle -F
   iptables -t mangle -X
  service network restart
 echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled

iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -A LOGDROP -j DROP

cd
cd

service iptables save
service iptables restart
echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled
service openvpn restart
service squid restart
chmod 777 /var/www/html/stat/status.log.txt
cd	

#install Stunnel
yum install stunnel -y 
wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/reyluar03/error/master/centos6/stunnel.conf"
wget -O /etc/stunnel/stunnel.pem "https://raw.githubusercontent.com/reyluar03/error/master/centos6/stunnel.pem"
chown nobody:nobody /var/run/stunnel
wget -O /etc/rc.d/init.d/stunnel "https://raw.githubusercontent.com/reyluar03/error/master/centos6/stunnel"
chmod 744 /etc/rc.d/init.d/stunnel
SEXE=/usr/bin/stunnel
SEXE=/usr/sbin/stunnel
 chmod +x /etc/rc.d/init.d/stunnel
 /sbin/chkconfig --add stunnel
 
#Install Dropbear
rpm -Uvh http://ftp-stud.hs-esslingen.de/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install dropbear -y
wget -O /etc/init.d/dropbear "https://raw.githubusercontent.com/reyluar03/error/master/centos6/dropbear"

#install PHP
yum install gcc php-devel php-pear libssh2 libssh2-devel make -y
yes | pecl install -f ssh2 -y
 echo extension=ssh2.so > /etc/php.d/ssh2.ini
service httpd restart
 php -m | grep ssh2
 
#start service
service httpd restart
service stunnel start
service dropbear start
service openvpn restart
service squid start

#for ssh backup connection
cd /root
mkdir rey
wget -O /root/rey/connection.php "https://raw.githubusercontent.com/reyluar03/error/master/freecron.sh"
echo "* * * * * /usr/bin/php /root/rey/connection.php
* * * * * /bin/bash /root/rey/active.sh
* * * * * /bin/bash /root/rey/not-active.sh" | tee -a /var/spool/cron/root

cd /root
rm free.sh
service crond restart
history -c



echo 'Done setup you can now close the terminal window and exit the app!';
echo '#############################################
#      CENTOS 6 Setup openvpn with ssl/ssh  #
#         FREE INSTALLATION DONE!      	    #
#       Setup by: Rey Luar Jr		        #
#          Server System: Panda VPN Pro     #
#            Owner: TEAM Panda VPN          #
#############################################';

