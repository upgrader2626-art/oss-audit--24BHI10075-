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
