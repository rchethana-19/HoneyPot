# Honeypot Setup Instructions (Day 1)

## 1. Environment
- OS: Ubuntu (VM)
- Tool: Cowrie (SSH Honeypot)

## 2. Steps
```bash
sudo apt update
sudo apt install git python3-venv openssh-server sshpass -y
git clone https://github.com/cowrie/cowrie
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
cp etc/cowrie.cfg.dist etc/cowrie.cfg
bin/cowrie start
```

## 3. SSH into Honeypot
```bash
ssh root@localhost -p 2222
```
