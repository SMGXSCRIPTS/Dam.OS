#!/data/data/com.termux/files/usr/bin/bash

#DO NOT ALTER THIS FILE UNLESS YOU KNOW WHAT YOUR DOING

#color of my rainbow
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'

#gaysussycolor
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"

function VERIFY_INSTALL (){
trap ' ' SIGTSTP SIGINT SIGTERM
clear
OVERRIDE_DAMOS_RCM=${OVERRIDE_DAMOS_RCM=:-0}
BANNER_VF
#if
echo " "
echo ${R}"Any Dam.OS Installation And Its Files Will Be Erased!"
read -p ${Y}"Do You Wish To Install The Dam.OS Software? [Y/N]: "${W} yn

case $yn in
    [yY] ) echo ${G}"Proceeding With Installation..." ; sleep 3;;
    [nN] ) echo ${R}"Exitting System..." ; sleep 2.6 ; clear;;
    RCM ) RCM_CHECK;;
    * ) echo ${Y}"INVALID RESPONSE"${W} ; sleep 1 ; echo "Exitting System..." ; sleep 2 ; clear;;
esac

clear
echo ${G}"DAM.OS Desktop Environments"
echo ${R}"The GNOME GUI Is Not Supported Without init.d Or systemd
Which Are Not Possible Without Special Software"
echo " "
echo ${Y}"Desktops:"
echo ${C}"KDE Plasma [1] - Heavy"
echo ${C}"LXDE [2] - Light"
echo ${C}"LXQT [3] - Light"
echo ${C}"MATE [4] - Very Light"
echo ${C}"GNOME [N/A] - Heavy"
read -p "Pick A GUI Desktop [#1-4]: " bit
case $bit in
    1 ) GUI_CHOICE=KDE ; INSTALL_MAIN;;
    2 ) GUI_CHOICE=LXDE ; INSTALL_MAIN;;
    3 ) GUI_CHOICE=LXQT ; INSTALL_MAIN;;
    4 ) GUI_CHOICE=MATE ; INSTALL_MAIN;;
    * ) echo "Invalid Response!" ; sleep 2.5 ; clear ; cat '/data/data/com.termux/files/usr/etc/motd'
esac
trap - SIGTSTP SIGINT SIGTERM
}

function GL_LAUNCH_SCRIPT (){
trap ' ' SIGTSTP SIGINT SIGTERM
touch '/data/data/com.termux/files/usr/bin/damos'

cat <<- EOF > '/data/data/com.termux/files/usr/bin/damos'
GALLIUM_DRIVER=virpipe MESA_GLES_VERSION_OVERRIDE=3.2 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE=GL_EXT_polygon_offset_clamp MESA_NO_ERROR=1 WINEDEBUG=-all virgl_test_server_android &
pulseaudio --start --exit-idle-time=-1

pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
export DISPLAY=:69
termux-x11 :69 &

case $1 in
    -s ) DAMOS-STANDALONE=--isolated
    --standalone ) DAMOS-STANDALONE=--isolated
    * ) DAMOS-STANDALONE=--no-sysvipc
esac

clear
echo "Welcome To Dam.OS"
proot-distro login damos $DAMOS-STANDALONE --shared-tmp --fix-low-ports
EOF

chmod +x '/data/data/com.termux/files/usr/bin/damos'
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> /data/data/com.termux/files/home/.bashrc
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE=GL_EXT_polygon_offset_clamp GALLIUM_DRIVER=virpipe WINEDEBUG=-all"' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bashrc
source ~/.bashrc
OTHER_SCRIPTS
trap - SIGTSTP SIGINT SIGTERM
}

function INSTALL_MAIN (){
trap ' ' SIGTSTP SIGINT SIGTERM
clear
BANNER_VF
echo " "
echo ${G}"INSTALLING MAIN DEPENDENCIES..."${W}
sleep 1.5
echo " "
yes | pkg update -y
yes | pkg upgrade -y
yes | apt update -y
yes | apt install x11-repo -y
yes | apt install proot-distro llvm sl wget curl virglrenderer-android xwayland tigervnc xorg-xhost nano termux-x11-nightly -y
yes | apt upgrade -y
if [ -f '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root' ]; then
    echo ${R}"A Current Dam.OS Distro Is Installed! Resetting..."${W} ; proot-distro remove damos;
fi

proot-distro install archlinux --override-alias damos
INSTALL_KERNEL_SCRIPT_$GUI_CHOICE

trap - SIGTSTP SIGINT SIGTERM
}

function INSTALL_KERNEL_SCRIPT_KDE (){
trap ' ' SIGTSTP SIGINT SIGTERM
clear
BANNER_VF
echo " "
touch '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'

cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
yes | pacman -S plasma-desktop llvm sl wget curl php python3 mesa-utils plasma kdeconnect chromium firefox pulseaudio zenity konsole dbus base-devel -y --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf ~/.bash_profile
EOF

touch '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start'
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start'

cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start'
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
DISPLAY=:69 dbus-launch --exit-with-session startplasma-x11 &
EOF

GL_LAUNCH_SCRIPT
trap - SIGTSTP SIGINT SIGTERM
}

function INSTALL_KERNEL_SCRIPT_LXDE (){
trap ' ' SIGTSTP SIGINT SIGTERM
clear
BANNER_VF
echo " "
touch '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'

cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
yes | pacman -S lxde gamin llvm sl wget curl php python3 mesa-utils chromium firefox pulseaudio zenity konsole dbus base-devel -y --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf ~/.bash_profile
EOF

touch '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start'
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start'

cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start'
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
DISPLAY=:69 dbus-launch --exit-with-session startlxde &
EOF

GL_LAUNCH_SCRIPT
trap - SIGTSTP SIGINT SIGTERM
}

function RCM_CHECK (){
trap ' ' SIGTSTP SIGINT SIGTERM
clear
BANNER_RCM
echo ${W}" "
echo ${C}"Checking System Loader..."${W}
sleep 3.4

case $OVERRIDE_DAMOS_RCM in
    1 ) echo " " ; echo ${R}"WARNING! THE RCM MODE IS UNLOCKED!" ; RCM_VF;;
    * ) echo " " ; echo ${Y}"THE RCM MODE IS LOCKED!" ; echo ${R}"Resetting..." ; sleep 2 ; VERIFY_INSTALL;;
esac
trap - SIGTSTP SIGINT SIGTERM
}

function RCM_VF (){
trap ' ' SIGTSTP SIGINT SIGTERM
read -p ${Y}"Are You Sure You Want To Proceed [Y/N]: " rcm_yn

case $rcm_yn in
    [yY] ) echo ${G}"Proceeding..." ; sleep 3 ; RCM_TOOLS;;
    [nN] ) echo ${C}"Resetting Script..." ; sleep 3 ; VERIFY_INSTALL;;
esac
trap - SIGTSTP SIGINT SIGTERM
}

function RCM_TOOLS (){
trap ' ' SIGTSTP SIGINT SIGTERM
clear
BANNER_RCM
echo " "
echo "        [1] File Editor        [2] "
trap - SIGTSTP SIGINT SIGTERM
}

function OTHER_SCRIPTS (){
trap ' ' SIGTSTP SIGINT SIGTERM
cd '$PREFIX/var/lib/proot-distro/installed-rootfs/damos/etc'

# OS-RELEASE

rm -rf '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/etc/os-release'
touch os-release

cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/etc/os-release'
NAME="Dam.OS Linux ARM"
PRETTY_NAME="Dam.OS Arch Linux ARM"
ID=damosarm
ID_LIKE=Arch
ID_UPDATE=Shovel
BUILD_ID=1.22
ID_FANCY_NAME="Dam.OS 1.22 Shovel"
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://archlinuxarm.org/"
DOCUMENTATION_URL="https://archlinuxarm.org/wiki"
SUPPORT_URL="https://archlinuxarm.org/forum"
BUG_REPORT_URL="https://github.com/archlinuxarm/PKGBUILDs/issues"
LOGO="/etc/logo"
EOF

# ASCII-LOGO

touch logo

cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/etc/logo'
                            .		   
                       St;888X 8.      
                      :  ;@ ;@  8; .    
                    88.X8. .  @:;;.t    
                .. %.@8...      .:.S;   
              .%tS;S t..        ..@ 8 . 
             ;t;8888S.Xt@.      . @ S.. 
            :% 8      t@8 : .     '|;:   
            .t 8l      8 t..    . . : . 
             ;.%.:X;8SS 8:.     . S @   
              .;.:.88@;8.         @ %.  
                X ;               t::t  
              ..@       .        ;;.%. 
             :88     @%%S8% 8:    .S @..
          8;8:      t.88X;X. :8   .X @  
       ;.S.8S      08     .%;;t;  ;t.S. 
     . t 8;        ;..       ;;X   |S.. 
     . X 8..       t.. .   ..@8     8.  
       ;@ t@S. :: 8.   ;8t;:      . ;.
        .Xt8;:;:%;%   :X.::. . ..t:t%.  
         .. :X@S...    8; t.888:X ;8.   
             .         .;%S@%%%@@:t..   
                        .. .    . .     
EOF

# SCREEN-RESOLUTION

#touch '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/damos-screen'
#chmod +rx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/damos-screen'

trap - SIGTSTP SIGINT SIGTERM
}

function BANNER_VF (){
printf ${G}'####################################################################\n'
printf ${G}'##                                                                ##\n'
printf ${G}'##  8888888b.                              .d88888b.   .d8888b.   ##\n'
printf ${G}'##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##\n'
printf ${G}'##  888    888                            888     888 Y88b.       ##\n'
printf ${G}'##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##\n'
printf ${G}'##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##\n'
printf ${G}'##  888    888 .d888888 888  888  888     888     888       "888  ##\n'
printf ${G}'##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##\n'
printf ${G}'##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##\n'
printf ${G}'##                                                                ##\n'
printf ${G}'####################################################################\n'
printf ${G}'_________________________/DAM.OS-INSTALLER\_________/Damian-Wuorio\_\n'${reset}
}

function BANNER_RCM (){
printf ${G}'####################################################################\n'
printf ${G}'##                                                                ##\n'
printf ${G}'##  8888888b.                              .d88888b.   .d8888b.   ##\n'
printf ${G}'##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##\n'
printf ${G}'##  888    888                            888     888 Y88b.       ##\n'
printf ${G}'##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##\n'
printf ${G}'##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##\n'
printf ${G}'##  888    888 .d888888 888  888  888     888     888       "888  ##\n'
printf ${G}'##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##\n'
printf ${G}'##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##\n'
printf ${G}'##                                                                ##\n'
printf ${G}'####################################################################\n'
printf ${G}'_________________________/RECOVERY-MODE\____________/Damian-Wuorio\_\n'${reset}
}

VERIFY_INSTALL