# Honeypot Setup Instructions (Part 1)

## 1. Environment
- **OS:** Ubuntu (VM)
- **Tool:** Cowrie (SSH Honeypot)

## 2. Installing Dependencies
Install the necessary dependencies for running Cowrie, including Python and required libraries:

```bash
sudo apt-get install git python3-virtualenv libssl-dev libffi-dev build-essential
```

## 3. Python Verification
Ensure the `python-is-python3` package is installed so that the `python` command refers to Python 3 (required for Cowrie):

```bash
sudo apt-get install python-is-python3
```

## 4. Adding a User
Add a new user named `cowrie` and disable its password for security:

```bash
sudo adduser --disabled-password --gecos "" cowrie
```

## 5. Setting Up Cowrie
- Clone the Cowrie repository from GitHub.
- Create and activate a Python virtual environment.
- Install Cowrie dependencies using pip.

```bash
git clone https://github.com/cowrie/cowrie.git
cd cowrie
python3 -m venv cowrie-env
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

## 6. Configuring Cowrie
- Copy and edit the configuration files as needed.
- Set up the fake filesystem using the `honeyfs` directory.

```bash
cp etc/cowrie.cfg.dist etc/cowrie.cfg
# Edit etc/cowrie.cfg as needed
```

## 7. Generating the Fake Filesystem
Generate the `fs.pickle` file using the contents of the `honeyfs` directory:

```bash
mkdir -p share/cowrie
python3 bin/fsctl create share/cowrie/fs.pickle honeyfs/
```

## 8. Running Cowrie
Start Cowrie using the following command:

```bash
bin/cowrie start
```

## 9. Attacker Activity from Kali Linux
As an attacker, execute the following commands from a Kali Linux machine to interact with the Cowrie honeypot:

### Reconnaissance
- **Nmap Scan:**
  ```bash
  nmap -sV <honeypot-ip>
  ```
- **Other Scanning/Enumeration Commands:**
  ```bash
  nmap -A <honeypot-ip>
  nmap -p 22 <honeypot-ip>
  hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://<honeypot-ip>
  ```

### Exploitation/Interaction
- **SSH Login Attempt:**
  ```bash
  ssh root@<honeypot-ip>
  ```
- **Post-Login Commands (executed after successful login to Cowrie):**
  ```bash
  ls
  pwd
  cat /etc/passwd
  uname -a
  whoami
  cd /home
  ```

## 10. Cowrie Logs
Cowrie logs attacker activity. Example log file location:

```
var/log/cowrie/cowrie.log
var/log/cowrie/cowrie.json
```





