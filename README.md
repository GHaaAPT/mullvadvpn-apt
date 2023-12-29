# mullvadvpn-apt
**Unofficial** APT repository for [Mullvad VPN](https://github.com/mullvad/mullvadvpn-app) that will check for updates regularly.

EZ update your Mullvad VPN Debian/Ubuntu client.

I do this for myself, but if you want to use it, feel free to audit this repo first and you are strongly recommended to do so.

# Install as APT repo manually
```shell
sudo apt remove mullvad-vpn # if you installed the vpn client through deb file already, uninstall first.
```
```shell
wget -qO- https://ghaaapt.github.io/mullvadvpn-apt/mullvad-vpn-archive-keyring.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mullvad-vpn-archive-keyring.gpg > /dev/null
chmod a+r /usr/share/keyrings/mullvad-vpn-archive-keyring.gpg
```
```shell
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/mullvad-vpn-archive-keyring.gpg] https://ghaaapt.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvad-vpn.list
```
```shell
sudo apt update && sudo apt install mullvad-vpn -y
```

# Install as APT repo automatically
```shell
wget -q https://ghaaapt.github.io/mullvadvpn-apt/install_mullvad_vpn.sh && sudo bash ./install_mullvad_vpn.sh
```

# Checksum
22113ddcd5d7f22c25beca3e7a2f706d5c8924bb648eb65ff2a078dc066b7bee  pool/main/m/mullvad-vpn/mullvad-vpn_2023.6_amd64.deb

# Copyright
The Mullvad VPN installer (deb file) is re-distributed in GPLv3

# Disclaimer
GHaaAPT is not affiliated, associated, authorized, endorsed by, or in any way officially connected with the Mullvad VPN AB, or any of its subsidiaries or its affiliates. The official Mullvad VPN AB website can be found at https://mullvad.net.

The names Mullvad VPN as well as related names, marks, emblems and images are registered trademarks of their respective owners.
