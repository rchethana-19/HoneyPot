# NeuroShield: Cowrie Honeypot Project

A beginner-friendly cybersecurity project that sets up and simulates attacks on a Cowrie honeypot, collects logs, and begins basic log analysis.

## Project Goals
- ✅ Deploy a Cowrie SSH honeypot on a local virtual machine.
- ✅ Simulate brute-force attacks and common reconnaissance behavior.
- ✅ Collect and parse logs.
- 🔜 Begin basic AI-based pattern analysis on attacker behavior.

## Setup
See [`setup_instructions.md`](setup_instructions.md) for complete environment installation steps, including:
- Installing dependencies
- Setting up the Cowrie honeypot
- Generating a fake filesystem
- Running Cowrie

## Simulating Attacks
Use the [`simulate_attacker.sh`](simulate_attacker.sh) script to:
- Automatically set up the honeypot (if not already done)
- Simulate brute-force SSH login attempts
- Simulate common attacker commands after a successful login
- (Optionally) Run additional reconnaissance tools like `nmap` and `hydra` (see script comments)

## Log Collection & Analysis
- Cowrie logs all activity to files such as `var/log/cowrie/cowrie.log` and `var/log/cowrie/cowrie.json`.
- Use analysis scripts (e.g., `analysis/day3_log_parser.py`) to parse and summarize log data.
- Suspicious sessions and key events are recorded in [`analysis/suspicious_sessions.csv`](analysis/suspicious_sessions.csv) for further review.

## Project Workflow
1. **Set up the Cowrie honeypot** using the instructions provided.
2. **Simulate attacker activity** using the provided shell script or manual commands.
3. **Collect and analyze logs** to identify suspicious behavior and attacker patterns.
4. **(Optional)** Extend the project with AI-based analysis or additional honeypot features.

## Author
Chethana R.
