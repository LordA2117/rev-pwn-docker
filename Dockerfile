FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root
WORKDIR /root

RUN apt update && apt install -y \
    git wget curl net-tools \
    tightvncserver \
    kali-desktop-xfce \
    python3 python-is-python3 \
    gdb novnc websockify dbus-x11 \
    gnupg

RUN apt install checksec python3-pwntools neovim

RUN git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef.git /root/gdb-peda-pwndbg-gef && \
    /root/gdb-peda-pwndbg-gef/install.sh

# Uncomment the next line if you wanna install ghidra
# RUN apt install -y ghidra

# VNC Password
RUN mkdir -p /root/.vnc && \
    echo "kali" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Create .xstartup for VNC
RUN echo '#!/bin/sh\nxrdb $HOME/.Xresources\nstartxfce4 &' > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html

EXPOSE 5900 9020

CMD bash -c "\
    vncserver :0 -geometry 1920x1080 -depth 16 -rfbauth /root/.vnc/passwd && \
    websockify --web=/opt/novnc 9020 localhost:5900 \
"

