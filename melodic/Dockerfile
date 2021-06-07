FROM osrf/ros:melodic-desktop-full

ENV DEBIAN_FRONTEND noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        locales \
    && echo "$LANG UTF-8" >> /etc/locale.gen \
    && locale-gen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y \
        dbus \
        dbus-x11 \
        systemd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && dpkg-divert --local --rename --add /sbin/udevadm \
    && ln -s /bin/true /sbin/udevadm
RUN systemctl disable systemd-resolved
VOLUME ["/sys/fs/cgroup"]
STOPSIGNAL SIGRTMIN+3
CMD [ "/sbin/init" ]

RUN apt-get update -y \
    && apt-get install -y \
        ubuntu-gnome-desktop \
    && apt-get remove gnome-initial-setup -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY tigervncserver_1.11.80+20201116git19165c8f-1ubuntu1_amd64.deb /tmp/

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        wget \
        libxfont-dev \
    && apt --fix-broken install -y \
    && dpkg -i /tmp/tigervncserver_1.11.80+20201116git19165c8f-1ubuntu1_amd64.deb \
    && rm /tmp/tigervncserver_1.11.80+20201116git19165c8f-1ubuntu1_amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        git \
        pwgen \
        net-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/novnc/noVNC.git /home/novnc \
    && cp home/novnc/vnc.html /home/novnc/index.html \
    && git clone https://github.com/kanaka/websockify /home/novnc/utils/websockify

COPY import_env.service /etc/systemd/system/import_env.service
RUN systemctl enable import_env

COPY tigervnc@.service /etc/systemd/system/tigervnc@.service
RUN systemctl enable tigervnc@:0

COPY novnc.service /etc/systemd/system/novnc.service
RUN systemctl enable novnc

EXPOSE 6000 6080 5900

RUN mkdir -p /root/.vnc & mkdir -p /root/.config/autostart
COPY startup.desktop /root/.config/autostart/startup.desktop
COPY set.sh /root/.vnc/set.sh
COPY docker-entrypoint.sh /
COPY custom.conf /etc/gdm3/custom.conf
COPY xserverrc /etc/X11/xinit/xserverrc

ENTRYPOINT ["/docker-entrypoint.sh"]
