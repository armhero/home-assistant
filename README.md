# Home-Assistant
[![](https://images.microbadger.com/badges/version/armhero/home-assistant.svg)](https://microbadger.com/images/armhero/home-assistant "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/armhero/home-assistant.svg)](https://microbadger.com/images/armhero/home-assistant "Get your own image badge on microbadger.com")

A [Home-Assistant](http://home-assistant.io) docker image for **ARMv7** (like Raspberry Pi 2 and above).

## Volumes
 * **/config**: All configuration files of home-assistant.

## Usage
```
docker run -p 3128:3128 -v HAConfig:/config -d armhero/home-assistant
```
Wait a few seconds and you can access home-assistant on port 3128 on your machine.
