#!/bin/bash

function compare_version() {
    version=$1
    no_major=$2
    no_minor=$3
    current_major=$(echo "$version" | cut -d "." -f 1)
    current_minor=$(echo "$version" | cut -d "." -f 2)
    if [ "$current_major" -gt "$no_major" ]; then
        return 0
    else
        if [ "$current_major" -eq "$no_major" ]; then
            if [ "$current_minor" -ge "$no_minor" ]; then
                return 0
            fi
        fi
    fi
    return 1
}

function compare_linux_version() {
    if [ -f /etc/os-release ]; then
        distro=$(egrep -o '(Ubuntu|Debian)' /etc/os-release | uniq)
        if [ "$distro" = 'Debian' ]; then
            distro_version="$(egrep 'VERSION_ID=' /etc/os-release | egrep -o '[0-9]{2}' | uniq)"
            distro_version_internal="$distro_version.9999"
            echo "$distro $distro_version"
            compare_version $distro_version_internal 10 0
            return $?
        elif [ "$distro" = 'Ubuntu' ]; then
            distro_version=$(egrep 'VERSION_ID=' /etc/os-release | egrep -o '[0-9]{2}.[0-9]{2}' | uniq)
            echo "$distro $distro_version"
            compare_version $distro_version 18 04
            return $?
        else
            if [ -z "$distro" ]; then
                distro=$(egrep -o 'ID="?[a-zA-Z]+"?' /etc/os-release | grep -oP '="?\K[^"]+')
            fi
            echo "$distro"
            return 2
        fi
    else
        return 3
    fi
}
echo 'Checking system requirements...'
if ! compare_version "$(uname -r)" 4 19; then
    read -p "Kernel ($(uname -r)) is not supported, proceed? [y/N] " proceed
    if [ ! "$proceed" = "y" ] && [ ! "$proceed" = "Y" ]; then exit 1; fi
fi
if [[ ! "$(uname -i)" =~ '64' ]]; then
    if [[ ! "$(uname -a)" =~ 'x86_64' ]]; then
        read -p "Hardware platform ($(uname -i)) is not supported, proceed? [y/N] " proceed
        if [ ! "$proceed" = "y" ] && [ ! "$proceed" = "Y" ]; then exit 1; fi
    fi
fi
linux=$(compare_linux_version)
status=$?
if [ "$status" -eq 3 ]; then
    read -p "No distro release information (/etc/os-release) available, proceed? [y/N] " proceed
    if [ ! "$proceed" = "y" ] && [ ! "$proceed" = "Y" ]; then exit 1; fi
elif [ "$status" -eq 2 ]; then
    read -p "Distro \"$linux\" is not included in this checking, proceed? [y/N] " proceed
    if [ ! "$proceed" = "y" ] && [ ! "$proceed" = "Y" ]; then exit 1; fi
elif [ "$status" -eq 1 ]; then
    read -p "$linux is not supported, proceed? [y/N] " proceed
    if [ ! "$proceed" = "y" ] && [ ! "$proceed" = "Y" ]; then exit 1; fi
fi
echo 'System requirements met or ignored!'
if ! dpkg -l | egrep '[^-]gnupg[1,2]?[^-]' &> /dev/null; then
    sudo apt update
    sudo apt install gnupg -y
fi
if dpkg -l | egrep 'mullvad-vpn' &> /dev/null; then 
    while true; do
        read -p "Mullvad VPN client already installed, which might causes trouble, remove it first? (Configuration will be retained) [y/n] " remove_flag
        if [ "$remove_flag" = "y" ] || [ "$remove_flag" = "Y" ]; then 
            sudo apt remove mullvad-vpn -y
            break
        elif [ "$remove_flag" = "n" ] || [ "$remove_flag" = "N" ]; then
            break
        fi
    done
fi
wget -qO- https://ghaaapt.github.io/mullvadvpn-apt/mullvad-vpn-archive-keyring.asc | gpg --dearmor | sudo tee /usr/share/keyrings/mullvad-vpn-archive-keyring.gpg > /dev/null && chmod a+r /usr/share/keyrings/mullvad-vpn-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/mullvad-vpn-archive-keyring.gpg] https://ghaaapt.github.io/mullvadvpn-apt/ stable main' | sudo tee /etc/apt/sources.list.d/mullvad-vpn.list
sudo apt update
sudo apt install mullvad-vpn -y
echo 'Installation complete'

