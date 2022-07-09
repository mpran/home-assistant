#!/bin/bash

install_packages() {
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $1
}

download_latest_os_agent() {
    version=$(curl --silent "https://api.github.com/repos/home-assistant/os-agent/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
    wget -O os-agent.deb https://github.com/home-assistant/os-agent/releases/download/$version/os-agent_"$version"_linux_armv7.deb
}

sudo apt-get update
echo "Install docker"
install_packages ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

install_packages docker-ce \
    docker-ce-cli \
    containerd.io

echo "Install home assistant"
install_packages ca-certificates \
    git \
    jq \
    wget \
    udisks2 \
    libglib2.0-bin \
    network-manager \
    dbus

echo "Installing os-agent"
download_latest_os_agent
sudo dpkg -i os-agent.deb

echo "Verifying os-agent installation"
gdbus introspect --system --dest io.hass.os --object-path /io/hass/os

echo "Installing supervised package"
wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb
sudo dpkg -i homeassistant-supervised.deb

git clone https://github.com/mpran/home-assistant.git

echo "Restarting to apply settings. OS might take some time to come back up, be patient"
sudo shutdown -r now
