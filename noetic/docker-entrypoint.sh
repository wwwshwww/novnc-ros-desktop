#!/bin/bash

if [ ! -f $HOME/.vnc/passwd ] ; then
  if [ -z "$PASSWORD" ] ; then
    PASSWORD=`pwgen -c -n -1 12`
    echo -e "PASSWORD = $PASSWORD" > /root/password.txt
  fi
  echo "root:$PASSWORD" | chpasswd

  su root -c "echo '$PASSWORD' | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd && touch /root/.Xresources"
fi

su root -c "echo session=gnome > /root/.vnc/config"

source /opt/ros/noetic/setup.bash
export ROS_IP=$(hostname -i)

env > /root/tmpenv

exec "$@"