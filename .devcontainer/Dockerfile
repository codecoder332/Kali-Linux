
FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    kali-desktop-xfce \
    xfce4-whiskermenu-plugin \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    dbus-x11 \
    xterm \
    locales \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY start-desktop.sh /usr/local/bin/start-desktop.sh
RUN chmod +x /usr/local/bin/start-desktop.sh

EXPOSE 6080

CMD ["/usr/local/bin/start-desktop.sh"]
