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
echo 'deb [signed-by=/usr/share/keyrings/mullvad-vpn-archive-keyring.gpg] https://ghaaapt.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvad-vpn.list
```
```shell
sudo apt update && sudo apt install mullvad-vpn -y
```

# Install as APT repo automatically
```shell
wget -q https://ghaaapt.github.io/mullvadvpn-apt/install_mullvad_vpn.sh && sudo bash ./install_mullvad_vpn.sh
```

# Checksum
8a8e913941e84818a3d5a87aca2d466e78bac96555a1864a51dec147e19728b8  pool/main/m/mullvad-vpn/mullvad-vpn_2024.1_amd64.deb  
6f32930127ea8e68f229979cafc30668285dea0e3c69085fa6e73e814ab0a0f2  pool/main/m/mullvad-vpn/mullvad-vpn_2024.1_arm64.deb  

# Copyright
The Mullvad VPN installers (deb files) are re-distributed in GPLv3

# Disclaimer
GHaaAPT is not affiliated, associated, authorized, endorsed by, or in any way officially connected with the Mullvad VPN AB, or any of its subsidiaries or its affiliates. The official Mullvad VPN AB website can be found at https://mullvad.net.

The names Mullvad VPN as well as related names, marks, emblems and images are registered trademarks of their respective owners.
