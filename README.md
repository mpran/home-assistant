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
#### Setting up static IP ####
- Access SD card from another machine
- Go to system-connections folder
- Edit resin-sample file and the following info:
```[connection]
id=my-ethernet
type=ethernet
interface-name=eth0
permissions=
secondaries=

[ethernet]
mac-address-blacklist=

[ipv4]
address1=<your ip>
dns=<your_dns_servers>;
dns-search=
method=manual

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto
```
- Put the SD card back to your Pi and turn on the device
- Should be able to access using new IP

### Working in ResinOS ###
- `/usr/bin/hassio homeassistant restart` - restarts home assistant
- `/usr/bin/hassio homeassistant check` - check if configuration is valid. Perfect when you're making changes and need to make sure if everything is cool with the system before trying to restart.
