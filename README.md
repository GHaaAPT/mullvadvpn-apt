# mullvadvpn-apt
Unofficial APT repository for [MullvadVPN](https://github.com/mullvad/mullvadvpn-app) that will check for updates regularly

EZ update your Mullvad VPN Debian/Ubuntu client

I do this for myself, but if you want to use it, feel free to audit this repo first and you are strongly recommended to do so.

# Install as APT repo manually
```shell
sudo apt remove mullvad-vpn # if you installed the vpn client through deb file already, uninstall first.
wget -qO- https://knugihk.github.io/mullvadvpn-apt/mullvad-vpn-archive-keyring.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mullvad-vpn-archive-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/mullvad-vpn-archive-keyring.gpg] https://knugihk.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvad-vpn.list
sudo apt update
sudo apt install mullvad-vpn -y
```

# Install as APT repo automatically
```shell
wget -qO- https://knugihk.github.io/mullvadvpn-apt/install_mullvad_vpn.sh | sudo bash
```

# Checksum
95b9638f304a00d72ce6b6f3a38ff9f623142541cfaa4d6e9aa142c27d86ea6e  pool/main/m/mullvad-vpn/mullvad-vpn_2021.6_amd64.deb

# Copyright
The Mullvad VPN installer (deb file) is re-distributed in GPLv3
