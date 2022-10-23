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
        'xorg-server'           	   # Xorg X server
        'xorg-apps'             	   # Group of Xorg apps
        'xorg-xinit'            	   # Xorg initialisation program
        'xf86-video-intel'      	   # X.org Intel i810/i830/i915/945G/G965+ video drivers
        'mesa'                  	   # An open-source implementation of the OpenGL specification
        # KDE PLASMA
        'plasma'       			   	   # Group for Plasma desktop and software
        'sddm'         				   # QML based X11 and Wayland display manager
        'kdeplasma-addons'             # All kind of addons to improve your Plasma experience
        'kdeconnect'                   # Adds communication between KDE and your smartphone
        # NETWORKING
        'wpa_supplicant'               # A utility providing key negotiation for WPA wireless networks
        'dialog'                       # A tool to display dialog boxes from shell scripts
        'networkmanager'               # Network connection manager and user applications
        'openvpn'                      # An easy-to-use, robust and highly configurable VPN (Virtual Private Network)
        'networkmanager-openvpn'       # NetworkManager VPN plugin for OpenVPN
        'network-manager-applet'       # Applet for managing network connections
        'dhcp'                  	   # RFC2131 compliant DHCP client daemon
        'libsecret'                    # Library for storing and retrieving passwords and other secrets
        # BLUETOOTH
        'bluez'                 	   # Daemons for the bluetooth protocol stack
        'bluez-utils'            	   # Development and debugging utilities for the bluetooth protocol stack
        'bluez-libs'                   # Deprecated libraries for the bluetooth protocol stack
        # AUDIO
        'pipewire'                     # Low-latency audio/video router and processor
        'pipewire-alsa'                # Low-latency audio/video router and processor - ALSA configuration
        'pipewire-jack'                # Low-latency audio/video router and processor - JACK support
        'pipewire-pulse'               # Low-latency audio/video router and processor - PulseAudio replacement
        # VIRTUALIZATION
        'virtualbox'                   # Powerful x86 virtualization for enterprise as well as home use
        'virtualbox-host-modules-arch' # Virtualbox host kernel modules for Arch Kernel
        # RICE
        'alacritty'                    # A cross-platform, GPU-accelerated terminal emulator
        'latte-dock'                   # A dock based on Plasma Frameworks
        'neofetch'                     # A CLI system information tool written in BASH that supports displaying images.
        # GOODIES
        'arandr'                       # Provide a simple visual front end for XRandR 1.2.
        'firefox'                      # Standalone web browser from mozilla.org
        'inkscape'                     # Professional vector graphics editor
        'keepassxc'                    # Cross-platform community-driven port of Keepass password manager
        'mpv'                          # a free, open source, and cross-platform media player
        'nano'                         # Pico editor clone with enhancements
        'nvidia'                       # NVIDIA drivers for linux
        'spectacle'                    # KDE screenshot capture utility
        'transmission-qt'              # Fast, easy, and free BitTorrent client (Qt GUI)
        'youtube-dl'                   # A command-line program to download videos from YouTube.com and a few more sites
        # AUR PACKAGES
        'apple-fonts'                           # Apple San Francisco, New York fonts, directly from Apple official source
        'betterdiscord-installer'               # Installer for BetterDiscord
        'catppuccin-gtk-theme-frappe'           # Soothing pastel theme for GTK3 - Frappe
        'catppuccin-gtk-theme-latte'            # Soothing pastel theme for GTK3 - Latte
        'catppuccin-gtk-theme-macchiato'        # Soothing pastel theme for GTK3 - Macchiato
        'catppuccin-gtk-theme-mocha'            # Soothing pastel theme for GTK3 - Mocha
        'discord-canary-electron-bin'           # Discord Canary (popular voice + video app) using the system provided electron for increased security and performance
        'plasma5-applets-window-appmenu-git'    # Plasma 5 applet in order to show the window appmenu
        'protonvpn'                             # Official ProtonVPN metapackage that installs protonvpn-gui and protonvpn-cli, maintained by the ProtonVPN team.
        'tela-icon-theme'                       # A flat colorful design icon theme.
)

for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    LANG=C yay -S --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" "$PKG"
done

echo
echo "Thanks for using skiOS! <333"
