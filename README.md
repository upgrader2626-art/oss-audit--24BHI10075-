# Open Source Audit — Python

## Student Details
Your Name: Rajveer  
Registration Number: 24BHI10075 
Course: Open Source Software 
University: VIT Bhopal 
Date: 31-03-2026 

## Project Description
This project is an audit of the Python open-source software. It includes Linux footprint analysis and shell scripting tasks. The audit is performed through five Bash scripts that collect system information, inspect Python packages, audit disk usage and permissions, analyze log files, and generate an open-source manifesto. The scripts demonstrate fundamental Linux administration skills, shell scripting techniques, and an understanding of open-source principles.

---

## Scripts Overview

| Script | Description |
|--------|-------------|
| `script1.sh` | System Identity Report – gathers system details such as hostname, OS version, kernel, user, uptime, and date. |
| `script2.sh` | Python Package Inspector – checks if Python is installed, displays its version and maintainer, and provides a brief open-source description. |
| `script3.sh` | Disk and Permission Auditor – audits permissions and disk usage of important directories like `/etc`, `/var/log`, `/home`, `/usr/bin`, and checks the Python directory. |
| `script4.sh` | Log File Analyzer – analyzes a given log file (e.g., `/var/log/syslog`) for a specified keyword (default: "error") and counts occurrences, showing the last 5 matching lines. |
| `script5.sh` | Open Source Manifesto Generator – prompts the user for three inputs and generates a personalized manifesto text file. |

---

## Detailed Scripts

### Script 1: System Identity Report (`script1.sh`)

This script prints a concise system identity report including the user's name, chosen software, Linux distribution, kernel version, current user, system uptime, current date/time, and a license note.

**Code:**
```bash
#!/bin/bash
# Script 1: System Identity Report

STUDENT_NAME="Your Name"
SOFTWARE_CHOICE="Python"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE=$(date)
DISTRO=$(lsb_release -d | cut -f2)

echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Software Chosen : $SOFTWARE_CHOICE"
echo "Linux Distro    : $DISTRO"
echo "Kernel Version  : $KERNEL"
echo "Current User    : $USER_NAME"
echo "System Uptime   : $UPTIME"
echo "Date & Time     : $DATE"
echo "License         : Linux is licensed under GPL"
echo "================================"
Sample Output:


================================
 Open Source Audit — Your Name
================================
Software Chosen : Python
Linux Distro    : Ubuntu 22.04.3 LTS
Kernel Version  : 5.15.0-91-generic
Current User    : student
System Uptime   : up 2 hours, 15 minutes
Date & Time     : Mon Mar 31 14:30:22 IST 2026
License         : Linux is licensed under GPL
================================
Script 2: Python Package Inspector (script2.sh)
This script checks if Python 3 is installed, displays its version, shows the maintainer from package information, and provides a brief open-source description for Python. It uses dpkg to verify installation and apt show to extract details.

Code:

bash
#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="python3"

if dpkg -l | grep -q $PACKAGE; then
    echo "$PACKAGE is installed."
    python3 --version
    apt show python3 | grep -E 'Version|Maintainer'
else
    echo "$PACKAGE is NOT installed."
fi

case $PACKAGE in
    python3) echo "Python: Open-source programming language used for AI, web, and automation." ;;
    git) echo "Git: Version control system." ;;
    vlc) echo "VLC: Multimedia player." ;;
    firefox) echo "Firefox: Web browser." ;;
    *) echo "Unknown package." ;;
esac
Sample Output:


python3 is installed.
Python 3.10.12
Version: 3.10.12-1~22.04.3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Python: Open-source programming language used for AI, web, and automation.
Script 3: Disk and Permission Auditor (script3.sh)
This script audits important directories for their permissions and disk usage. It iterates through a predefined list of directories (/etc, /var/log, /home, /usr/bin, /tmp), checks if each exists, and prints its permissions (owner, group) and size. It also specifically checks the existence of the Python directory.

Code:

bash
#!/bin/bash
# Script 3: Disk and Permission Auditor

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist"
    fi
done

if [ -d "/usr/lib/python3" ]; then
    echo "Python directory exists."
    ls -ld /usr/lib/python3
else
    echo "Python directory not found."
fi
Sample Output:


Directory Audit Report
----------------------
/etc => Permissions: drwxr-xr-x root root | Size: 12M
/var/log => Permissions: drwxr-xr-x root root | Size: 1.2G
/home => Permissions: drwxr-xr-x root root | Size: 8.0G
/usr/bin => Permissions: drwxr-xr-x root root | Size: 1.5G
/tmp => Permissions: drwxrwxrwt root root | Size: 4.0K
Python directory exists.
drwxr-xr-x 12 root root 4096 Mar 31 10:00 /usr/lib/python3
Script 4: Log File Analyzer (script4.sh)
This script analyzes a given log file for a specific keyword (default: "error"). It counts the number of lines containing the keyword and prints the last five matching lines. The script expects two arguments: the log file path and an optional keyword.

Code:

bash
#!/bin/bash
# Script 4: Log File Analyzer

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

if [ ! -f "$LOGFILE" ]; then
    echo "File not found."
    exit 1
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
Sample Output:


Keyword 'error' found 23 times in /var/log/syslog
Last 5 matching lines:
Mar 31 14:20:15 ubuntu kernel: [ 1234.567890] EXT4-fs error (device sda1): ...
Mar 31 14:22:30 ubuntu systemd[1]: Failed to start service.
...
Script 5: Open Source Manifesto Generator (script5.sh)
This script asks the user three questions about open-source tools, freedom, and what they would build. It then generates a manifesto text file named manifesto_<username>.txt with the current date and the user's responses.

Code:

bash
#!/bin/bash
# Script 5: Open Source Manifesto Generator

echo "Answer three questions to generate your manifesto."

read -p "1. Name one open-source tool you use: " TOOL
read -p "2. In one word, what does freedom mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

echo "On $DATE, I believe open source is about $FREEDOM. I use $TOOL and I would like to build $BUILD and share it with the community." > $OUTPUT

echo "Manifesto saved to $OUTPUT"
cat $OUTPUT
Sample Interaction:


Answer three questions to generate your manifesto.
1. Name one open-source tool you use: Git
2. In one word, what does freedom mean to you? Empowerment
3. Name one thing you would build and share freely: A collaborative coding platform

Manifesto saved to manifesto_student.txt
On 31 March 2026, I believe open source is about Empowerment. I use Git and I would like to build A collaborative coding platform and share it with the community.
How to Run
Make the scripts executable:

bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
Execute each script:

bash
./script1.sh
./script2.sh
./script3.sh
./script4.sh /var/log/syslog error
./script5.sh
script4.sh accepts two arguments: the log file path and the keyword to search (defaults to "error").

Dependencies
Operating System: Linux (Mint/Ubuntu recommended)

Python 3: For script2.sh to display Python version.

Bash: All scripts are written in Bash and require a standard Bash environment.

Utilities: dpkg, apt, grep, awk, cut, du, ls, whoami, uname, uptime, lsb_release, date, read – all are standard on Ubuntu/Mint.

Screenshots
All relevant screenshots (installation, footprint commands, script outputs) are stored in the screenshots/ folder inside the project directory. These screenshots form the visual evidence for the project report.


Repository Structure:

oss-audit/
│
├── script1.sh
├── script2.sh
├── script3.sh
├── script4.sh
├── script5.sh
├── README.md
├── screenshots/
└── report.pdf
