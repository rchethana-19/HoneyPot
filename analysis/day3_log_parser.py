import json

with open("../logs/cowrie.json", "r") as file:
    lines = [json.loads(line) for line in file if line.strip()]

commands = [entry for entry in lines if entry.get("eventid") == "cowrie.command.input"]
logins = [entry for entry in lines if "login" in entry.get("eventid", "")]

print("Total sessions:", len(set(e["session"] for e in lines if "session" in e)))
print("Total commands:", len(commands))
print("Unique IPs:", set(e.get("src_ip") for e in lines if "src_ip" in e))

for cmd in commands[-10:]:
    print(f'{cmd["timestamp"]}: {cmd["input"]}')
