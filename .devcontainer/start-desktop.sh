
#!/bin/bash
set -eu

export DISPLAY=:1
export HOME=/root
export LANG=C.UTF-8

Xvfb :1 -screen 0 1280x800x24 -ac -nolisten tcp \
  >/tmp/xvfb.log 2>&1 &
sleep 2

dbus-launch --exit-with-session startxfce4 \
  >/tmp/xfce.log 2>&1 &
sleep 5

x11vnc -display :1 -localhost -nopw -forever -shared \
  -rfbport 5901 >/tmp/x11vnc.log 2>&1 &
sleep 2

exec websockify --web=/usr/share/novnc/ \
  6080 localhost:5901
