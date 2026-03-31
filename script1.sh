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
