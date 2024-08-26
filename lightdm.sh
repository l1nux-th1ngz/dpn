# Install Lightdm and Slick Greeter
sudo apt-get install -y --no-install-recommends lightdm lightdm-gtk-greeter-settings slick-greeter

# Configure Lightdm
sudo tee /etc/lightdm/lightdm.conf <<EOF
[UserList]
minimum-uid=500
hidden-users=nobody nobody4 noaccess
hidden-shells=/bin/false /usr/sbin/nologin /sbin/nologin

[Seat:*]
user-session=bspwm
greeter-session=slick-greeter

[Greeter]
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
# Clock format: Month Day Hour:Minute AM/PM
clock-format=%B %d %I:%M %p
EOF

# Enable Lightdm service
sudo systemctl enable lightdm

# Restart Lightdm to apply changes
sudo systemctl restart lightdm
