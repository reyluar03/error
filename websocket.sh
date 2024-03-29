install_require()
{
clear
echo "Updating your system."
{
apt-get -o Acquire::ForceIPv4=true update
} &>/dev/null
clear
echo "Installing dependencies."
{
apt-get -o Acquire::ForceIPv4=true install python dos2unix screen curl -y
} &>/dev/null
}
install_socks()
{
clear
echo "Installing socks."
{
wget --no-check-certificate https://raw.githubusercontent.com/reyluar03/error/master/reyproxy.py -O ~/.ubuntu.py
dos2unix ~/.ubuntu.py
chmod +x ~/.ubuntu.py
cat > /etc/condom.sh << END
service stunnel4 restart
screen -dmS socks python ~/.ubuntu.py
exit 0
END
chmod +x /etc/condom.sh
sudo crontab -l | { echo '@reboot bash /etc/condom.sh'; } | crontab -
} &>/dev/null
}
install_stunnel()
{
clear
echo "Modifying stunnel."
{
cd /etc/stunnel && rm stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[stunnel]
connect = 127.0.0.1:80
accept = 443
[dropbear]
accept = 445
connect = 127.0.0.1:550
[openssh]
accept = 444
connect = 127.0.0.1:225
[openvpn]
accept = 587
connect = 127.0.0.1:110" >> stunnel.conf
cd /etc/default && rm stunnel4
echo 'ENABLED=1
FILES="/etc/stunnel/*.conf"
OPTIONS=""
BANNER="/etc/banner"
PPP_RESTART=0
RLIMITS=""' >> stunnel4
chmod 755 stunnel4
sudo service stunnel4 restart
} &>/dev/null
}
install_done()
{
clear
echo "WEBSOCKET SSH SERVER"
echo "IP : $(curl -s https://api.ipify.org)"
echo "Server Rebooting..."
echo
echo
history -c;
rm ~/.installer
sleep 5
reboot
}

apt-get purge apache2 -y 

install_require
install_socks
install_done
