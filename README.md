# Docker Image for to use Desktop environment of ROS Melodic in Browser

Shall we get a rich desktop environment of ROS?

## Components

- OS Image: Ubuntu 18.04
  - Desktop: GNOME Desktop
- VNC viewer: NoVNC
- VNC server: TigerVNC
- ROS distro: Melodic

## Usage

See `docker-compose.yaml`.

### Example

Start container:
```
docker run --rm \
  --tmpfs /run  --tmpfs /run/lock --tmpfs /tmp \
  --cap-add SYS_BOOT --cap-add SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -e PASSWORD=password
  -p 6080:6080 moyash/novnc-ros-desktop
```

Open `localhost:6080` in your browser and type `password` for vnc-auth:

![image](https://user-images.githubusercontent.com/41321650/95768029-a5e71000-0cf0-11eb-8f48-41cdea4c631b.png)

Run as much as you want. Don't forget setting ROS.