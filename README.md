# mullvadvpn-apt
Unofficial APT repository for [MullvadVPN](https://github.com/mullvad/mullvadvpn-app) that will check for updates regularly

EZ update your Mullvad VPN Debian/Ubuntu client

I do this for myself, but if you want to use it, feel free to audit this repo first and you are strongly recommended to do so.

# Install as APT repo manually
```shell
sudo apt remove mullvad-vpn # if you installed the vpn client through deb file already, uninstall first.
```
```shell
wget -qO- https://knugihk.github.io/mullvadvpn-apt/mullvad-vpn-archive-keyring.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mullvad-vpn-archive-keyring.gpg > /dev/null
```
```shell
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/mullvad-vpn-archive-keyring.gpg] https://knugihk.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvad-vpn.list
```
```shell
sudo apt update && sudo apt install mullvad-vpn -y
```

# Install as APT repo automatically
```shell
wget -q https://knugihk.github.io/mullvadvpn-apt/install_mullvad_vpn.sh && sudo bash ./install_mullvad_vpn.sh
```

# Checksum
87f73868f1fa1364f36d71913a92c9805f6e1d8723bca896e6ea48a1ba4933da  pool/main/m/mullvad-vpn/mullvad-vpn_2022.2_amd64.deb

# Copyright
The Mullvad VPN installer (deb file) is re-distributed in GPLv3
