echo "Installing Server";
apt-get install php php-mysqli php-mysql php-gd php-mbstring -y > /dev/null 2>&1
mkdir /root/rey
EOM

/bin/cat <<"EOM" >/root/cron.sh
php /usr/local/sbin/ssh.php
chmod +x /root/rey/active.sh
chmod +x /root/rey/inactive.sh
bash /root/rey/active.sh
bash /root/rey/inactive.sh
EOM


RED='\033[01;31m';
RESET='\033[0m';
GREEN='\033[01;32m';
WHITE='\033[01;37m';
YELLOW='\033[00;33m';
display_memo () {
clear
echo -e "${YELLOW}#############################################"
echo -e "#  AUTOSCRIPT - ACCOUNT LINKER FOR FFAST    #"
echo -e "#       Setup By: Rey Luar Jr               #"
echo -e "#       Server System: FFASTVPN             #"
echo -e "#   owner: Richard Caritos Verdadero        #"
echo -e "#############################################${RESET}"
}
clear
display_memo
PS3='Please enter your choice:'
options=("Install Premium" "Install VIP" "Install PRIVATE" "Quit")
select opt in "${options[@]}"
do
case $opt in
"Install Premium")
display_memo;
wget -O /usr/local/sbin/ssh.php https://raw.githubusercontent.com/reyluar03/error/master/cron.sh -q
(crontab -l 2>/dev/null || true; echo "* * * * * /bin/bash /root/cron.sh >/dev/null 2>&1") | crontab -
service cron restart
rm -rf /root/linker.sh
history -c
cd /root
echo "" > .bash_history
clear
display_memo;
echo -e "${GREEN} Premium Installed ${RESET}";
break;;
"Install VIP")
display_memo;
wget -O /usr/local/sbin/ssh.php https://raw.githubusercontent.com/reyluar03/error/master/vipcron.sh -q
(crontab -l 2>/dev/null || true; echo "* * * * * /bin/bash /root/cron.sh >/dev/null 2>&1") | crontab -
service cron restart
rm -rf /root/linker.sh
history -c
cd /root
echo "" > .bash_history
clear
display_memo;
echo -e "${GREEN} VIP Installed ${RESET}";
break;;
"Install PRIVATE")
display_memo;
wget -O /usr/local/sbin/ssh.php https://raw.githubusercontent.com/reyluar03/error/master/privcron.sh -q
(crontab -l 2>/dev/null || true; echo "* * * * * /bin/bash /root/cron.sh >/dev/null 2>&1") | crontab -
service cron restart
rm -rf /root/linker.sh
history -c
cd /root
echo "" > .bash_history
clear
display_memo;
echo -e "${GREEN} Private Installed ${RESET}";
break;;
"Quit")
echo "Installation Cancelled"
break;;
*) echo invalid option;;
esac
done
