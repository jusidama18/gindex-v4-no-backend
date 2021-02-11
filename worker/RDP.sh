#! /bin/bash
printf "Installing RDP Be Patience... " >&2
{
sudo useradd -m John
sudo adduser John sudo
echo 'John:2001' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser John chrome-remote-desktop
sudo apt-get install vlc
sudo apt-get install gdebi
sudo apt-get install -f
wget https://github.com/tonikelope/megabasterd/releases/download/v7.40/MegaBasterdLINUX_7.40_portable.zip
unzip MegaBasterdLINUX_7.40_portable.zip
cd /content/MegaBasterdLINUX
chmod +x MegaBasterd.run
cd /content/
mkdir xdm
cd /content/xdm/
wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz
tar -xf xdm-setup-7.2.11.tar.xz
sudo ./install.sh
cd /content/
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt update && sudo apt install telegram
sudo add-apt-repository -y ppa:gnome3-team/gnome3
sudo apt-get update && sudo apt-get install gnome-shell ubuntu-gnome-desktop 
sudo apt-get install gnome-session-flashback
sudo apt install ffmpeg
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt install obs-studio
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - John -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
