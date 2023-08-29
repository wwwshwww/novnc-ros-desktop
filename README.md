# Docker Images for to use Desktop environment of ROS in Browser

GitPod Friendly! :D (PS: if the Docker extension is not installed on gitpod make sure to download it!)

[![Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/from-referrer)

## Details

image: `moyash/novnc-ros-desktop:melodic`

- OS: Ubuntu 18.04
  - Desktop: GNOME Desktop
- VNC viewer: NoVNC
- VNC server: TigerVNC
- ROS distro: Melodic

image: `moyash/novnc-ros-desktop:noetic`

- OS: Ubuntu 20.04
  - Desktop: GNOME Desktop
- VNC viewer: NoVNC
- VNC server: TigerVNC
- ROS distro: Noetic

## Usage

See `docker-compose.yaml`.

### Example

Start container:
```
docker run --rm \
  --tmpfs /run  --tmpfs /run/lock --tmpfs /tmp \
  --cap-add SYS_BOOT --cap-add SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -e PASSWORD=password \
  -p 6080:6080 moyash/novnc-ros-desktop:melodic
```

Open `localhost:6080` in your browser and type `password` for vnc-auth:

### Or 

Start container:
```
docker run --rm \
  --tmpfs /run  --tmpfs /run/lock --tmpfs /tmp \
  --cap-add SYS_BOOT --cap-add SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -e PASSWORD=password \
  -p 6080:6080 moyash/novnc-ros-desktop:noetic
```

  For Noetic Version

![image](https://user-images.githubusercontent.com/41321650/96120866-2775b280-0f2a-11eb-8673-3f6a73bfef74.png)

Run as much as you want. Don't forget setting ROS.
