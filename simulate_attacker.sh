#!/bin/bash

# -----------------------------
# Honeypot Setup Commands (run on the honeypot host)
# -----------------------------
echo "[*] Setting up Cowrie honeypot..."
sudo apt-get install git python3-virtualenv libssl-dev libffi-dev build-essential -y
sudo apt-get install python-is-python3 -y
sudo adduser --disabled-password --gecos "" cowrie
sudo -u cowrie bash << HONEYPOT_SETUP
cd ~
git clone https://github.com/cowrie/cowrie.git
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
cp etc/cowrie.cfg.dist etc/cowrie.cfg
# Edit etc/cowrie.cfg as needed
mkdir -p share/cowrie
python3 bin/fsctl create share/cowrie/fs.pickle honeyfs/
bin/cowrie start
HONEYPOT_SETUP

# -----------------------------
# Attacker Simulation Commands (run as attacker against honeypot)
# -----------------------------

# Simulate SSH brute-force attempts
# (Assumes Cowrie is running on port 2222)
echo "[*] Simulating SSH login attempts..."
for i in {1..5}; do
    sshpass -p "wrongpass$i" ssh -o StrictHostKeyChecking=no -p 2222 root@localhost exit
done

echo "[*] Simulating attacker commands..."
sshpass -p "letmein" ssh -tt -o StrictHostKeyChecking=no -p 2222 root@localhost << EOF
ls
pwd
cat /etc/passwd
uname -a
whoami
cd /home
exit
EOF

# Additional attacker recon (run from attacker machine, not inside SSH session)
# Replace <honeypot-ip> with the actual IP if running from a different host
# nmap -sV <honeypot-ip>
# nmap -A <honeypot-ip>
# nmap -p 22 <honeypot-ip>
# hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://<honeypot-ip>
