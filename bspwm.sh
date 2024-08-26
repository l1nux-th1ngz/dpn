#!/bin/bash

# Xorg display server installation
sudo apt install -y xorg xserver-xorg xbacklight xbindkeys xvkbd xinput xserver-xorg-input-all

# PACKAGE INCLUDES build-essential
sudo apt install -y build-essential git xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev xdotool autoconf automake
sudo apt install -y libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev curl wget net-tools  i3lock-fancy tty-clock lsd pamixer g++
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev 
sudo apt install -y libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev watchman libfreetype6-dev libfontconfig1-dev
sudo apt install -y meson picom libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-present-dev libpixman-1-dev
sudo apt install -y libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev
sudo apt install -y libcurl4-openssl-dev libssl-dev libffi-dev bison flex check libpango-1.0-0 libpango1.0-dev libpangocairo-1.0-0 libcairo2 libglib2.0-dev libgdk-pixbuf-2.0-0 
sudo apt install -y libstartup-notification0 libstartup-notification0-dev libgdk-pixbuf-2.0-dev libxkbcommon-dev libxkbcommon-x11-dev librsvg2-dev clang
sudo apt install -y python3 python3-dev arandr fzf ripgrep universal-ctags silversearcher-ag fd-find xsel rbenv htop python3-pip cmake-extras ascii 

# Polkits and Microcode
sudo apt install -y intel-microcode policykit-1-gnome pkexec policykit-1 policykit-desktop-privileges polkitd

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs gvfs-backends gnome-power-manager

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# File Manager
sudo apt install -y nemo ranger xdg-user-dirs xdg-user-dirs-gtk
# Create user directories
xdg-user-dirs-update
xdg-user-dirs-gtk-update

# Terminal
sudo apt install -y kitty alacritty

# Sound packages and media
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa
sudo apt install -y arandr duf font-manager hwinfo hw-probe lolcat lxappearance most nitrogen nomacs numlockx 
sudo apt install -y  silversearcher-ag dconf-editor  qbittorrent rxvt-unicode mpv vlc jp2a

# Neofetch/HTOP
sudo apt install -y neofetch htop zenity yad

# Network Manager
sudo apt install -y network-manager network-manager-gnome 

# Installation for Appearance management
sudo apt install -y lxappearance 

# Fonts and icons
sudo apt install -y fonts-firacode fonts-liberation2 fonts-ubuntu papirus-icon-theme fonts-cascadia-code arc-theme toilet toilets-fonts
sudo apt install -y fonts-font-awesome fonts-terminus fonts-powerline numix-icon-theme numix-gtk-theme materia-gtk-theme dmz-cursor-theme

# EXA 
sudo apt install -y exa

# Bluetooth packages
sudo apt install -y bluez blueman
# Enable Bluetooth
sudo systemctl enable bluetooth  

# Packages needed for bspwm installation
sudo apt install -y bspwm dmenu sxhkd numlockx rofi dunst libnotify-bin unzip geany scrot maim geany-plugins dex suckless-tools slop polybar scrub
sudo apt install -y  bat locate wmname  imagemagick

# Move bspwm configuration files to ~/.config/
mv bspwm ~/.config/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize

# Move sxhkd configuration files to ~/.config/
mv sxhkd ~/.config/
chmod +x ~/.config/sxhkd/sxhkdrc

# Move polybar configuration files to ~/.config/
mv polybar ~/.config/
chmod +x ~/.config/polybar/launch.sh

# Move rofi and picom configuration files to ~/.config/
mv rofi ~/.config/
mv picom ~/.config/

# Move whichSystem.py to /usr/local/bin/ and make it executable
sudo mv whichSystem.py /usr/local/bin/
sudo chmod +x /usr/local/bin/whichSystem.py

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings slick-greeter

# Configure Lightdm
sudo tee /etc/lightdm/lightdm.conf <<EOF
[UserList]
minimum-uid=500
hidden-users=nobody nobody4 noaccess
hidden-shells=/bin/false /usr/sbin/nologin /sbin/nologin

[SeatDefaults]
user-session=bspwm

[greeter]
font-name=Ubuntu 11
xft-antialias=true
xft-dpi=96
xft-hintstyle=hintslight
xft-rgba=rgb
indicators=~host;~spacer;~clock;~spacer;~session;~a11y;~language;~power
keyboard=onboard
reader=orca
position=50%,center 50%,center
default-user-image=#avatar-default
screensaver-timeout=60
a11y-states=contrast;font;keyboard;reader
user-background=false
clock-format=%a %d %b, %H:%M
EOF

sudo systemctl enable lightdm

