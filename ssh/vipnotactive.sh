#!/bin/bash
wget -O auto-not-active.sh http://pandavpn.cf/sshssl/vip-not-active.txt
chmod 744 auto-not-active.sh
sh auto-not-active.sh
