#!/usr/bin/env bash

echo
echo "Initializing ski lift, an Arch post-install/skiOS configuration script"
echo

set -e

echo
echo "Installing skiOS packages now..."
echo

sudo pacman -S git

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R ski:ski ./yay-git
cd yay-git
makepkg -si


PKGS=(
		# XORG
        'xorg-server'           	
        'xorg-apps'             	
        'xorg-xinit'            	
        'xf86-video-intel'      	
        'mesa'                  	
        # KDE PLASMA
        'plasma'       				
        'sddm'         				
        'kdeplasma-addons'
        'kdeconnect'
        # NETWORKING
        'wpa_supplicant'          
        'dialog'                   
        'networkmanager'            
        'openvpn'                  
        'networkmanager-openvpn'    
        'network-manager-applet'    
        'dhcp'                  	
        'libsecret'                
        # BLUETOOTH
        'bluez'                 	
        'bluez-utils'            	
        'bluez-libs'
        # AUDIO
        'pipewire'
        'pipewire-alsa'
        'pipewire-jack'
        'pipewire-pulse'
        # VIRTUALIZATION
        'virtualbox'
        'virtualbox-host-modules-arch'
        # RICE
        'alacritty'
        'latte-dock'
        'neofetch'
        # GOODIES
        'arandr'
        'firefox'
        'inkscape'
        'keepassxc'
        'mpv'
        'nano'
        'nvidia'
        'screenfetch'
        'spectacle'
        'transmission-qt'
        'youtube-dl'
        # AUR PACKAGES
        'apple-fonts'
        'betterdiscord-installer'
        'catppuccin-gtk-theme-frappe'
        'catppuccin-gtk-theme-latte'
        'catppuccin-gtk-theme-macchiato'
        'catppuccin-gtk-theme-mocha'
        'discord-canary-electron-bin'
        'plasma5-applets-window-appmenu-git'
        'protonvpn' 
        'tela-icon-theme'
)

for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    LANG=C yay -S --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" "$PKG"
done

echo
echo "Thanks for using skiOS! <333"
