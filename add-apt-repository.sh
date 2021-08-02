#!/bin/bash

wget -qO- https://knugihk.github.io/mullvadvpn-apt/apt_key.pgp | sudo apt-key add -
echo 'deb https://knugihk.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvadvpn.list
sudo apt update
sudo apt install mullvad-vpn
