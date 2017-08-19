# home-assistant

### Raspberry Pi 3 setup instructions: ###
- Download [Etcher](https://etcher.io/)
- Download ResinOS [image](https://github.com/home-assistant/hassio-build/releases/download/1.0/resinos-hassio-1.0-raspberrypi3.img.bz2) for Raspberry Pi 3
- Flash the image with etcher to micro SD card
- Insert SD card into your Pi and turn on
- It will install home automation on boot (should take ~20 minutes)
#### Optional ####
- Navigate to http://hassio.local:8123/hassio/store
- Search for SSH server addon and install it
- Set password and restart SSH server
- ssh root@hassio.local and enter newly set password
