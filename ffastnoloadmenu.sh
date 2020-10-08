RED='\033[01;31m';
RESET='\033[0m';
GREEN='\033[01;32m';
WHITE='\033[01;37m';
YELLOW='\033[00;33m';
display_memo () {
clear
echo -e "${YELLOW}#############################################"
echo -e "#  Debian9 GTM NO LOAD SETUP SOCKS PROXY    #"
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
wget -O gtmnoload.sh https://raw.githubusercontent.com/reyluar03/error/master/ffastgtmnoload.sh -q; bash gtmnoload.sh;
clear
display_memo;
echo -e "${GREEN} Premium Installed ${RESET}";
break;;
"Install VIP")
display_memo;
wget -O /usr/local/sbin/ssh.php https://raw.githubusercontent.com/reyluar03/error/master/vipcron.sh -q
wget -O gtmnoload.sh https://raw.githubusercontent.com/reyluar03/error/master/ffastgtmnoload.sh -q; bash gtmnoload.sh;
clear
display_memo;
echo -e "${GREEN} VIP Installed ${RESET}";
break;;
"Install PRIVATE")
display_memo;
wget -O /usr/local/sbin/ssh.php https://raw.githubusercontent.com/reyluar03/error/master/privcron.sh -q
wget -O gtmnoload.sh https://raw.githubusercontent.com/reyluar03/error/master/ffastgtmnoload.sh -q; bash gtmnoload.sh;
clear
display_memo;
echo -e ='lREEN} Private Installed ${RESET}";
break;;
"Quit")
echo "Installation Cancelled"
break;;
*) echo invalid option;;
esac
done
