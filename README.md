# mullvadvpn-apt
Unofficial APT repository for MullvadVPN 

EZ update Mullvad VPN Debian/Ubuntu client

I do this for myself, but if you want to use it, feel free to audit this repo first and you are strongly recommended to do so.

# Install as APT repo manually
```shell
sudo apt remove mullvad-vpn # if you installed the vpn client through deb file already, uninstall first.
wget -qO- https://knugihk.github.io/mullvadvpn-apt/apt_key.pgp | sudo apt-key add -
echo 'deb https://knugihk.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvadvpn.list
sudo apt update
sudo apt install mullvad-vpn
```

# Install as APT repo automatically
```shell
wget -qO- https://knugihk.github.io/mullvadvpn-apt/add-apt-repository.sh | sudo bash
```

# Checksum
2671c6e2a0fa9c7da5ed10981e66fb52cce7d26accb05b4c1d0ddc2a95dcab4d  pool/main/m/mullvad-vpn/mullvad-vpn_2021.4_amd64.deb

# Copyright
The Mullvad VPN installer (deb file) is re-distributed in GPLv3
