#!/data/data/com.termux/files/usr/bin/bash

#DO NOT ALTER THIS FILE UNLESS YOU KNOW WHAT YOUR DOING
#THIS PROGRAM INSTALLER SCRIPT IS PROPERTY OF DAM.OS

#This Installer Script Installs Dam.OS 1.22 Shovel!

#Terminal-Colors
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'

#Terminal-Colors
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"
B="$(printf '\033[1;34m')"

function VERIFY_USER_USE (){
clear
DF_CHECKER=$(df -h | grep /storage/emulated | awk '{print $4}')
STORAGE_AMOUNT=${DF_CHECKER}
case $STORAGE_AMOUNT in
    "*M" ) DAMOS_STORAGE_PASS=1;;
    "*G" ) STORAGE_SYSTEM;;
esac

if [ -f '/data/data/com.termux/files/home/.damos/user-passwd' ]; then echo ${R}"Password Detected!"; sleep 0.4; VERIFY_IDENITY; else VERIFY_INSTALL; fi
}

function STORAGE_SYSTEM (){
DF_CHECKER_ALT=$(df -h | grep /storage/emulated | awk '{print 4}' | cut -d "G" -f 1)
STORAGE_AMOUNT2=${DF_CHECKER_ALT}
if [ ${STORAGE_AMOUNT2} -ge 7 ]; then DAMOS_STORAGE_PASS=0 ; else DAMOS_STORAGE_PASS=1 ; fi
}

function VERIFY_IDENITY (){
clear
BANNER_RCM
echo
DAMOSPASSWORD=$(grep damos-passwd '/data/data/com.termux/files/home/.damos/user-passwd' | cut -d "=" -f 2)
PASS=${DAMOSPASSWORD}
read -p ${B}"Please Enter Your Dam.OS Password: "${W} MAIN_PASSWD
case $MAIN_PASSWD in
    ${PASS} ) echo ${B}"Correct, Proceeding..."; sleep 1.2; VERIFY_INSTALL;;
    IDR ) echo ${Y}"You Do Not Remember Your Password"; sleep 2; PASSWD_IDR;;
    * ) echo ${R}"INCORRECT PASSWORD..."; sleep 1.5; VERIFY_IDENITY;;
esac
}
# password questions for recovery -- probably gonna be removed
function PASSWD_IDR (){
clear
BANNER_RCM
echo
COLORQU=$(grep damos-color-check /data/data/com.termux/files/home/.damos/user-passwd | cut -d "=" -f 2)

read -p "What is your favorite Color?: " colorq
case $colorq in
    ${COLORQU} ) echo ${G}"Correct."; PASSWD_IDR_2;;
    * ) echo "Incorrect..."
esac
}

function VERIFY_INSTALL (){
clear
OVERRIDE_DAMOS_RCM=${OVERRIDE_DAMOS_RCM=:-0}
BANNER_VF
case $DAMOS_STORAGE_PASS in
    1 ) echo; echo ${R}"WARNING! ${Y}It Is Advised To Have Atleast 7GB Of Memory"; echo;;
    * ) echo;;
esac
echo ${R}"Any Dam.OS Installation And Its Files Will Be Erased!"
read -p ${Y}"Do You Wish To Install The Dam.OS Software? [Y/N]: "${W} yn

case $yn in
    [yY] ) echo ${G}"Proceeding With Installation..."; sleep 3; INSTALL_PICKER;;
    [nN] ) echo ${R}"Exitting System..."; sleep 2.6; clear; exit;;
    RCM ) RCM_CHECK;;
    * ) echo ${Y}"INVALID RESPONSE"${W}; sleep 1; echo "Exitting System..."; sleep 2; clear;;
esac
PWD_RECORD=$(pwd)
cat > /data/data/com.termux/files/home/.damos-record.tmp
cat <<-EOF> /data/data/com.termux/files/home/damos-record.tmp
DAMOS_PWD=$PWD_RECORD
EOF
}

function INSTALL_PICKER (){
clear
BANNER_VF
echo
echo ${G}"DAM.OS Desktop Environments"
echo ${R}"The GNOME GUI Is Not Supported Without init.d Or systemd
Which Are Not Possible Without Special Software"
echo
echo ${Y}"Desktops:"
echo ${C}"KDE Plasma [${W}1${C}] ${R}- Heavy"
echo ${C}"LXDE [${W}2${C}] ${G}- Light -- Recommended"
echo ${C}"XFCE [${W}3${C}] ${G}- Light -- Recommended"
echo ${C}"LXQT [${W}4${C}] ${Y}- Semi-Light -- Not Recommended - Slightly Broken"
echo ${C}"MATE [${W}5${C}] ${Y}- Medium"
echo ${C}"GNOME [${R}N/A${C}] ${R}- Very Heavy -- Not Recommended"
echo ${C}"No GUI, Only CLI [${W}6${C}] ${G}- Very Light"
echo ${G}You Have 
read -p ${C}"Pick A GUI Desktop [${G}#1-6${C}]: "${W} damos_gui_install_choice
case $damos_gui_install_choice in
    1 ) GUI_CHOICE=KDE ; INSTALL_MAIN;;
    2 ) GUI_CHOICE=LXDE ; INSTALL_MAIN;;
    3 ) GUI_CHOICE=XFCE ; INSTALL_MAIN;;
    4 ) GUI_CHOICE=LXQT ; INSTALL_MAIN;;
    5 ) GUI_CHOICE=MATE ; INSTALL_MAIN;;
    6 ) GUI_CHOICE=CLI ; INSTALL_MAIN;;
    * ) echo "Invalid Response!"; sleep 2.5; clear; cat '/data/data/com.termux/files/usr/etc/motd'
esac
}

function GL_LAUNCH_SCRIPT (){
echo '#!/data/data/com.termux/files/usr/bin/bash

# Dam.OS Launcher Script

# To Bind A Directory Please type " --bind /ENTER/FILEPATH:/ENTER/SAME_FILEPATH " on NORMAL_USE | "proot-distro login damos --no-sysvipc --shared-tmp";; "
# --bind /storage/7B1A-274B:/storage/7B1A-274B
# Note in Standalone Mode Unbinds Every Main System Partion Including Your Custom Binds And Isolates Your Dam.OS System

R=$(printf "\033[1;31m")
Y=$(printf "\033[1;33m")
W=$(printf "\033[1;37m")

function LIST_SYSTEM (){
SYSTEM_ARCH_COM=$(dpkg --print-architecture)
case $SYSTEM_ARCH_COM in
    aarch64 ) SYSTEM_ARCH_CH=ARM64;;
    arm ) SYSTEM_ARCH_CH=ARM32;;
esac

case $SYSTEM_ARCH_COM in
    aarch64 ) SYSTEM_WINE_PREFIX=amd64;;
    arm ) SYSTEM_WINE_PREFIX=i386;;
esac

echo
echo ${W}"OPERATING_SYSTEM = Dam.OS Linux ARM"
sleep 0.45
echo ${W}"UPDATE_NAME = Shovel"
sleep 0.45
echo ${W}"UPDATE_VERSION = 1.22"
sleep 0.45
echo ${W}"WINE_VERSION = Wine-GE_Proton8.14-$SYSTEM_WINE_PREFIX"
sleep 0.45
echo ${W}"CURRENT_LINUX_TERMINAL = Termux / Dam.OS Launch Program"
sleep 0.45
echo ${W}"MAIN_UNIX_DISTRUBUTION = ArchLinux"
sleep 0.45
echo ${W}"SYSTEM_TYPE = Service-Package"
sleep 0.45
echo ${W}"ARCHITECTURE = $SYSTEM_ARCH_CH"
sleep 0.45
echo
}

function DAMOS_HELP (){
sleep 0.4
echo "This Command Starts The Dam.OS System"
sleep 0.4
echo "		-s, --standalone  |  This Will Unbind Dam.OS, The Majority of itself From your Android System"
sleep 0.4
echo "		-h, --help	      |  Shows you this Help Information"
sleep 0.4
echo "		-v, --version     |  Shows you the Current Version of Dam.OS"
sleep 0.4
echo "		-- If No Arguement Is Given Dam.OS Will Start Normally"
sleep 0.4
echo
}

function STANDALONE (){
MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 MESA_NO_ERROR=1 virgl_test_server_android &
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
export DISPLAY=:69
termux-x11 :69 &
proot-distro login damos --shared-tmp --fix-low-ports --isolated
}

function NORMAL_USE (){
MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 MESA_NO_ERROR=1 virgl_test_server_android &
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
export DISPLAY=:69
termux-x11 :69 &
proot-distro login damos --shared-tmp --no-sysvipc --fix-low-ports
}

case $1 in
    --help ) DAMOS_HELP;;
    -h ) DAMOS_HELP;;
    --version ) LIST_SYSTEM;;
    -v ) LIST_SYSTEM;;
    -s ) STANDALONE;;
    --standalone ) STANDALONE;;
    -n ) NORMAL_USE;;
    --normal ) NORMAL_USE;;
    * ) echo ${R}"ERROR! ${Y}No Action Specified"${W};;
esac' >> /data/data/com.termux/files/usr/bin/damos

echo 'clear' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/bin/cls

chmod +rx '/data/data/com.termux/files/usr/bin/damos'
echo 'MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android' >> /data/data/com.termux/files/usr/bin/gl
echo 'MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE=GL_EXT_polygon_offset_clamp GALLIUM_DRIVER=virpipe WINEDEBUG=-all' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/bin/gl
chmod +x '/data/data/com.termux/files/usr/bin/gl' '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/bin/gl' '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/bin/cls'
source ~/.bashrc
OTHER_SCRIPTS
}

function INSTALL_MAIN (){
TERMUX_ALLOW_EXTERNAL_APPS=$(grep 'allow-external-apps = true' /data/data/com.termux/files/home/.termux/termux.properties)

case $TERMUX_ALLOW_EXTERNAL_APPS in
    '# allow-external-apps = true' ) sed -i s/'# allow-external-apps = true'/'allow-external-apps = true'/ /data/data/com.termux/files/home/.termux/termux.properties;;
    'allow-external-apps = true' ) echo ${B}"ALLOW_EXTERNAL_APPS Has Already Been Set. Skipping..."; sleep 1.6;;
    * ) echo ${R}"ALLOW_EXTERNAL_APPS Has Been Erased! ${Y}Adding..."; sleep 1.6; echo "allow-external-apps = true" >> /data/data/com.termux/files/home/.termux/termux.properties;;
esac

clear
BANNER_VF
echo
echo ${G}"INSTALLING MAIN DEPENDENCIES..."${W}
sleep 1.5
echo
yes | pkg update -y
yes | pkg upgrade -y
yes | apt update -y
yes | apt install x11-repo -y
yes | apt install figlet toilet proot-distro llvm wget curl virglrenderer-android xwayland tigervnc xorg-xhost termux-x11-nightly pulseaudio sox play-audio -y
yes | apt upgrade -y

proot-distro remove damos
rm -rf /data/data/com.termux/files/usr/bin/damos
clear
BANNER_VF
echo
proot-distro install archlinux --override-alias damos
proot-distro clear-cache

INSTALL_KERNEL_SCRIPT_$GUI_CHOICE
}

function INSTALL_KERNEL_SCRIPT_KDE (){
clear
BANNER_VF
echo
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'
cat <<-EOF> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
pacman -S plasma-desktop tar sed llvm sl wget curl php python3 mesa-utils plasma kdeconnect chromium firefox pulseaudio zenity konsole dbus base-devel dolphin --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf '/root/.bash_profile'
echo 'echo "Welcome to the KDE-Plasma Dam.OS Terminal"' >> '/root/.bashrc'
mv '/etc/arch-release' '/etc/.damos-release'
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
export PULSE_SERVER=127.0.0.1 && pulseaudio -D --system --disable-shm=1 --exit-idle-time=-1 --disallow-exit --disallow-module-loading
dbus-daemon --system
echo "Please Start Your Termux-X11 Application"
env DISPLAY=:69 dbus-launch --exit-with-session startplasma-x11 &
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
OS-RELEASE
}

function INSTALL_KERNEL_SCRIPT_XFCE (){
clear
BANNER_VF
echo
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'
cat <<-EOF> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
pacman -S xfce4 xfce4-goodies tar sed llvm sl wget curl php python3 mesa-utils kdeconnect chromium firefox pulseaudio zenity gnome-terminal dbus base-devel dolphin --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf '/root/.bash_profile'
echo 'echo "Welcome to the Xfce4 Dam.OS Terminal"' >> '/root/.bashrc'
mv '/etc/arch-release' '/etc/.damos-release'
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
cat <<-EOF> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
export PULSE_SERVER=127.0.0.1 && pulseaudio -D --system --disable-shm=1 --exit-idle-time=-1 --disallow-exit --disallow-module-loading
dbus-daemon --system
echo "Please Start Your Termux-X11 Application"
sleep 1
env DISPLAY=:69 dbus-launch --exit-with-session startxfce4 &
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
OS-RELEASE
}

function INSTALL_KERNEL_SCRIPT_CLI (){
clear
BANNER_VF
echo
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'
cat <<-EOF> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
pacman -S sl wget tar sed curl php python3 pulseaudio dbus base-devel --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf '/root/.bash_profile'
echo 'echo "Welcome to the Dam.OS Terminal"' >> '/root/.bashrc'
mv '/etc/arch-release' '/etc/.damos-release'
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
OS-RELEASE
}

function INSTALL_KERNEL_SCRIPT_LXDE (){
clear
BANNER_VF
echo
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'
cat <<-EOF> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
pacman -S lxde lxdm tar sed llvm sl wget curl php python3 mesa-utils chromium firefox pulseaudio gnome-terminal zenity dbus base-devel dolphin --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf '/root/.bash_profile'
echo 'echo "Welcome to the LXDE Dam.OS Terminal"' >> '/root/.bashrc'
mv '/etc/arch-release' '/etc/.damos-release'
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
export PULSE_SERVER=127.0.0.1 && pulseaudio -D --system --disable-shm=1 --exit-idle-time=-1 --disallow-exit --disallow-module-loading
dbus-daemon --system
echo "Please Start Your Termux-X11 Application"
sleep 0.5
env DISPLAY=:69 dbus-launch --exit-with-session startlxde &
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
OS-RELEASE
}

function INSTALL_KERNEL_SCRIPT_LXQT (){
clear
BANNER_VF
echo
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'
cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
pacman -S lxqt kdeconnect tar sed llvm sl wget curl php python3 mesa-utils chromium firefox pulseaudio gnome-terminal zenity dbus base-devel dolphin --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf '/root/.bash_profile'
echo 'echo "Welcome to the LXQT Dam.OS Terminal"' >> '/root/.bashrc'
mv '/etc/arch-release' '/etc/.damos-release'
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
export PULSE_SERVER=127.0.0.1 && pulseaudio -D --system --disable-shm=1 --exit-idle-time=-1 --disallow-exit --disallow-module-loading
dbus-daemon --system
echo "Please Start Your Termux-X11 Application"
sleep 1
env DISPLAY=:69 dbus-launch --exit-with-session startlxqt &
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
OS-RELEASE
}

function INSTALL_KERNEL_SCRIPT_MATE (){
clear
BANNER_VF
echo
echo 'bash "/root/DAMOS_GUI_INSTALL.sh"' >> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/.bash_profile'
cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
yes | pacman -Syu
yes | pacman -Syy sudo
pacman -S mate mate-extra tar sed llvm sl wget curl php python3 mesa-utils kdeconnect chromium firefox pulseaudio zenity gnome-terminal dbus base-devel dolphin --noconfirm
yes | pacman -Syu
yes | pacman -Syy
rm -rf '/root/DAMOS_GUI_INSTALL.sh'
rm -rf '/root/.bash_profile'
echo 'echo "Welcome to the Mate Dam.OS Terminal"' >> '/root/.bashrc'
mv '/etc/arch-release' '/etc/.damos-release'
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh'
cat <<- EOF > '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
export PULSE_SERVER=127.0.0.1 && pulseaudio -D --system --disable-shm=1 --exit-idle-time=-1 --disallow-exit --disallow-module-loading
dbus-daemon --system
echo "Please Start Your Termux-X11 Application"
sleep 1
env DISPLAY=:69 dbus-launch --exit-with-session mate-session &
EOF
chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/start-de'
OS-RELEASE
}

function RCM_CHECK (){
clear
BANNER_RCM
echo
echo ${C}"Checking System Loader..."${W}
sleep 3.4

case $OVERRIDE_DAMOS_RCM in
    1 ) echo; echo ${R}"WARNING! THE RCM MODE IS UNLOCKED!"; RCM_VF;;
    * ) echo; echo ${Y}"THE RCM MODE IS LOCKED!"; echo ${R}"Resetting..."; sleep 2; VERIFY_INSTALL;;
esac
}

function RCM_VF (){
read -p ${Y}"Are You Sure You Want To Proceed [Y/N]: "${W} rcm_yn

case $rcm_yn in
    [yY] ) echo ${G}"Proceeding..."; sleep 3; RCM_TOOLS;;
    [nN] ) echo ${C}"Resetting Script..."; sleep 3; VERIFY_INSTALL;;
esac
}

function RCM_TOOLS (){
clear
BANNER_RCM
echo
echo ${G}"[1] File Editor/Manager"
echo ${G}"[2] Calculator"
echo
echo ${C}"More Tools Will Be Added In The BlackDiamond Update!"
read -p ${Y}"#1-2: "${W} RCM_PICKER_2

case $RCM_PICKER_2 in
    1 ) echo; echo ${C}"Launching File Explorer..."; sleep 2.4; DAMOS_RCM_CHECK_FILE;;
    2 ) echo; echo ${C}"Launching RCM Calculator?"; sleep 2; RCM_CALCULATOR;;
    * ) echo ${R}"Invalid Response..."; sleep 2; RCM_TOOLS;;
esac
}

function DAMOS_RCM_CHECK_FILE (){
OVERRIDE_DAMOS_RCM_FILE_CHECK=${OVERRIDE_DAMOS_RCM_FILE_CHECK=:-0}
if [ -f /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/etc/.damos-release ]; then OVERRIDE_DAMOS_RCM_FILE_CHECK=1 ; fi
case $OVERRIDE_DAMOS_RCM_FILE_CHECK in
    1 ) DAMOS_SU_CHECK;;
    * ) clear; BANNER_RCM; echo; echo ${R}"ERROR! ${Y}The Dam.OS System Is Not Installed!"; sleep 2.4; echo ${B}"Reseting..."; sleep 1; VERIFY_INSTALL;;
esac
}

function DAMOS_SU_CHECK (){
case $EUID in
    0 ) clear; echo ${R}"ERROR! ${Y}Cannot Run Super User In Dam.OS RCM";;
    * ) RCM_FILES;;
esac
}

function RCM_FILES (){
trap ' ' SIGTSTP SIGINT SIGTERM
cd '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos'
clear
BANNER_RCM
echo
echo ${G}"Use ${Y}'rcm-kill' ${G}To Exit RCM Mode and Dam.OS Installer"
echo ${R}"Warning! ${Y}CTRL-C Has Been Removed To Prevent Killing Dam.OS RCM CLi"
echo
for i in {1..90000}; do read -p ${R}"DAMOS-RCM${W}~${R}$ "${W} DAMOS_RCM_SYSTEM_COMMAND_LINE; EXECUTE_RCM_LINE; done
trap - SIGTSTP SIGINT SIGTERM
}

function EXECUTE_RCM_LINE (){
case $DAMOS_RCM_SYSTEM_COMMAND_LINE in
    rcm-kill* ) cd; exit;;
    su* ) echo; echo ${R}"ERROR! ${Y}Cannot Run Super User In Dam.OS RCM"; echo;;
    sudo* ) echo; echo ${R}"ERROR! ${Y}Cannot Run Super User In Dam.OS RCM"; echo;;
    exit* ) false;;
    reset* ) clear; cat '/data/data/com.termux/files/usr/etc/motd';;
    rcm-reset* ) clear; BANNER_RCM; echo; echo ${G}"Use ${Y}'rcm-kill' ${G}To Exit RCM Mode and Dam.OS Installer"; echo ${R}"Warning! ${Y}CTRL-C Has Been Removed To Prevent Killing Dam.OS RCM CLi"; echo;;
    damos-version ) echo; DAMOS_CURRENT_VERSION; echo;;
    damos ) echo; echo ${R}"ERROR! ${Y}Cannot Start Dam.OS System While In RCM"; echo;;
    damos-source ) for i in {1..10000}; do cat /data/data/com.termux/files/usr/bin/bash; done;;
    'damos --export RCM_CLI' ) echo ${G}"Writing..."; WRITE_COMMAND_DAMOS_RCM_VF;;
    * ) ${DAMOS_RCM_SYSTEM_COMMAND_LINE};;
esac
}

function DAMOS_CURRENT_VERSION (){
SYSTEM_ARCH=$(dpkg --print-architecture)
case $SYSTEM_ARCH in
    aarch64 ) SYSTEM_ARCH_CH=ARM64;;
    arm ) SYSTEM_ARCH_CH=ARM32;;
esac

case $SYSTEM_ARCH in
    aarch64 ) SYSTEM_WINE_PREFIX=amd64;;
    arm ) SYSTEM_WINE_PREFIX=i386;;
esac

echo ${W}"OPERATING_SYSTEM = Dam.OS"
echo
sleep 0.45
echo ${W}"UPDATE_NAME = Shovel"
echo
sleep 0.45
echo ${W}"UPDATE_VERSION = 1.22"
echo
sleep 0.45
echo ${W}"WINE_VERSION = PlayOnLinux_8.12-$SYSTEM_WINE_PREFIX"
echo
sleep 0.45
echo ${W}"CURRENT_LINUX_TERMINAL = Termux / Dam.OS RCM Command Line"
echo
sleep 0.45
echo ${W}"MAIN_LINUX_DISTRUBUTION = ArchLinux"
echo
sleep 0.45
echo ${W}"SYSTEM_TYPE = Service-Package"
echo
sleep 0.45
echo ${W}"ARCHITECTURE = $SYSTEM_ARCH_CH"
sleep 0.45
}

function WRITE_COMMAND_DAMOS_RCM_VF (){
if [ ! -f /data/data/com.termux/files/usr/bin/damos-rcm ]; then DAMOS_RCM_COMMAND_CHECK=0 ; else DAMOS_RCM_COMMAND_CHECK=1 ; fi

case $DAMOS_RCM_COMMAND_CHECK in
    1 ) echo ${R}"Warning! ${Y}A Dam.OS RCM Command Already Exists!"; VERIFY_RCM_RESET;;
    0 ) WRITE_COMMAND_DAMOS_RCM;;
esac
}

function VERIFY_RCM_RESET (){
clear
BANNER_RCM
echo
echo
read -p ${Y}"Would You like To Reset Dam.OS RCM Command? [Y/N]:${W} " RCM_CONFM

case $RCM_CONFM in
    [yY] ) echo ${G}"Confirmed!"; sleep 1; rm -rf /data/data/com.termux/files/usr/bin/damos-rcm ; WRITE_COMMAND_DAMOS_RCM;;
    [nN] ) echo ${Y}"Returning..."; sleep 1; RCM_FILES;;
    * ) echo ${R}"Invalid Response!"; sleep 1; RCM_FILES;;
esac
}

function WRITE_COMMAND_DAMOS_RCM (){
echo '#!/data/data/com.termux/files/usr/bin/bash

#This Is The Dam.OS Recovery Mode Program Script!

#Terminal-Colors
R=$(printf "\033[1;31m")
G=$(printf "\033[1;32m")
Y=$(printf "\033[1;33m")
W=$(printf "\033[1;37m")
C=$(printf "\033[1;36m")
B=$(printf "\033[1;34m")

function DAMOS_SU_CHECK (){
case $EUID in
    0 ) clear; echo ${R}"ERROR! ${Y}Cannot Run Super User In Dam.OS RCM";;
    * ) RCM_FILES;;
esac
}

function RCM_FILES (){
trap " " SIGTSTP SIGINT SIGTERM
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos
clear
BANNER_RCM
echo
echo ${G}"Use ${Y}rcm-kill ${G}To Exit RCM Mode and Dam.OS Installer"
echo ${R}"Warning! ${Y}CTRL-C Has Been Removed To Prevent Killing Dam.OS RCM CLi"
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/
echo
for i in {1..90000}; do read -p ${R}"DAMOS-RCM${W}~${R}$ "${W} DAMOS_RCM_SYSTEM_COMMAND_LINE; EXECUTE_RCM_LINE; done
trap - SIGTSTP SIGINT SIGTERM
}

function EXECUTE_RCM_LINE (){
case $DAMOS_RCM_SYSTEM_COMMAND_LINE in
    rcm-kill* ) cd; exit;;
    su* ) echo; echo ${R}"ERROR! ${Y}Cannot Run Super User In Dam.OS RCM"; echo;;
    sudo* ) echo; echo ${R}"ERROR! ${Y}Cannot Run Super User In Dam.OS RCM"; echo;;
    exit* ) false;;
    reset* ) clear; cat /data/data/com.termux/files/usr/etc/motd;;
    rcm-reset* ) clear; BANNER_RCM; echo; echo ${G}"Use ${Y}rcm-kill ${G}To Exit RCM Mode and Dam.OS Installer"; echo ${R}"Warning! ${Y}CTRL-C Has Been Removed To Prevent Killing Dam.OS RCM CLi"; echo;;
    damos-version ) echo; DAMOS_CURRENT_VERSION; echo;;
    damos ) echo; echo ${R}"ERROR! ${Y}Cannot Start Dam.OS System While In RCM"; echo;;
    damos-source ) for i in {1..10000}; do cat /data/data/com.termux/files/usr/bin/bash; done;;
    "damos --export RCM_CLI" ) echo ${G}"Dam.OS RCM Command Has Already Been Exported!";;
    * ) ${DAMOS_RCM_SYSTEM_COMMAND_LINE};;
esac
}

function DAMOS_CURRENT_VERSION (){
SYSTEM_ARCH=$(dpkg --print-architecture)
case $SYSTEM_ARCH in
    aarch64 ) SYSTEM_ARCH_CH=ARM64;;
    arm ) SYSTEM_ARCH_CH=ARM32;;
esac

case $SYSTEM_ARCH in
    aarch64 ) SYSTEM_WINE_PREFIX=amd64;;
    arm ) SYSTEM_WINE_PREFIX=i386;;
esac

echo ${W}"OPERATING_SYSTEM = Dam.OS"
echo
sleep 0.45
echo ${W}"UPDATE_NAME = Shovel"
echo
sleep 0.45
echo ${W}"UPDATE_VERSION = 1.22"
echo
sleep 0.45
echo ${W}"WINE_VERSION = Wine_Proton-8.14_$SYSTEM_WINE_PREFIX"
echo
sleep 0.45
echo ${W}"CURRENT_LINUX_TERMINAL = Termux / Dam.OS RCM Command Line"
echo
sleep 0.45
echo ${W}"MAIN_LINUX_DISTRUBUTION = ArchLinux"
echo
sleep 0.45
echo ${W}"SYSTEM_TYPE = Service-Package"
echo
sleep 0.45
echo ${W}"ARCHITECTURE = $SYSTEM_ARCH_CH"
sleep 0.45
}

function BANNER_RCM (){
printf ${R}"####################################################################"
printf ${R}"##                                                                ##"
printf ${R}"##  8888888b.                              .d88888b.   .d8888b.   ##"
printf ${R}"##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##"
printf ${R}"##  888    888                            888     888 Y88b.       ##"
printf ${R}"##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##"
printf ${R}"##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##"
printf ${R}"##  888    888 .d888888 888  888  888     888     888       "888  ##"
printf ${R}"##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##"
printf ${R}"##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##"
printf ${R}"##                                                                ##"
printf ${R}"####################################################################"
printf ${R}"_________________________/RECOVERY-MODE\____________/Damian-Wuorio\_"${W}
}

DAMOS_SU_CHECK' >> /data/data/com.termux/files/usr/bin/damos-rcm

chmod +rwx /data/data/com.termux/files/usr/bin/damos-rcm
sleep 1.5
clear
BANNER_RCM
echo
echo ${G}"Command Written!"
echo ${G}"Command is ${Y}'damos-rcm'"
sleep 2.6
RCM_FILES
}

function RCM_CALCULATOR (){
echo "The RCM Calculator Is Coming With The BlackDiamond Update!"; sleep 2; exit
}

function OS-RELEASE (){
# OS-RELEASE
echo 'rm -rf /etc/os-release
rm -rf /usr/lib/os-release

cat <<-EOF> /usr/lib/os-release
NAME="Dam.OS"
PRETTY_NAME="Dam.OS Linux ARM"
ID=damos-arm
ID_LIKE=Arch
ID_UPDATE=Shovel
BUILD_ID=Shovel / 1.22
ID_FANCY_NAME="Dam.OS 1.22 Shovel"
ANSI_COLOR="38;2;23;147;209"
LOGO="/etc/logo"
PLOGO="/etc/damos/DAM.OS-LOGO_V2.png"
SYSTEM_TYPE="Service-Package"
EOF

ln -P /usr/lib/os-release /etc/os-release

clear
echo "Please Login With The damos Command To Launch Dam.OS"
sleep 2' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh

DOWNLOAD_LIB
}

function DOWNLOAD_LIB (){
echo ${C}" "
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/etc/
mkdir damos
cd damos
curl -o DAM.OS-LOGO_V2.png https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-LOGO_V2.png
mkdir wallpapers
cd wallpapers
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER.jpg
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-2.jpg
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-3.jpg
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-4.jpg
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-5.jpg
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-6.jpg
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-7.jpg

DAMOS_WINE_SETUP
echo ${W}" "
GL_LAUNCH_SCRIPT
}

function DAMOS_WINE_SETUP (){
mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/lib/damos-system/
echo 'mkdir /usr/lib/damos-system/wine/
cd /usr/lib/damos-system/wine
curl -o WINE_PACKAGE.tar.gz https://github.com/GloriousEggroll/proton-ge-custom/releases/GE-Proton8-14.tar.gz
tar -xvf WINE_PACKAGE.tar.gz
rm -rf WINE_PACKAGE.tar.gz
ln -s /usr/lib/damos-system/wine/bin/wine /usr/local/bin/wine
ln -s /usr/lib/damos-system/wine/bin/wine64 /usr/local/bin/wine64
ln -s /usr/lib/damos-system/wine/bin/winebuild /usr/local/bin/winebuild
ln -s /usr/lib/damos-system/wine/bin/winecfg /usr/local/bin/winecfg
ln -s /usr/lib/damos-system/wine/bin/wineserver /usr/local/bin/wineserver
chmod +x /usr/local/bin/wine
chmod +x /usr/local/bin/wine64
chmod +x /usr/local/bin/winebuild
chmod +x /usr/local/bin/winecfg
chmod +x /usr/local/bin/wineserver
pacman -Syu -y
wget https://github.com/xDoge26/proot-setup/raw/main/box86_64.sh; bash box86_64.sh; rm box86_64.sh
source /bin/SYSTEM_EXIT' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/root/DAMOS_GUI_INSTALL.sh
}

function OTHER_SCRIPTS (){
# ASCII-LOGO

cat <<-EOF> '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/etc/logo'
                                       ++                                       
                                      ?~~-                                      
                                      +~+~<                                     
                                     +~~~+~                                     
                                    +~+~+~~+<                                   
                                   -~+~~~~~~+                                   
                                  _~~~+~+~~~~+                                  
                                 _~+~~~~~~~~~~+                                 
                                ~~~~~~~~~~~~~<~~                                
                               <+~~~~+~~~~~~<~<~+                               
                               ~~~~~~~~~~~~~~<~<~[                              
                              ~~~~~~~~~~~<~<~<~<<<)                             
                             ~~~~~~~~~~<~~<~<~<~<~<<                            
                            +~~~~~~~~<~~<~<~<<~<<<~<?                           
                           ~~~~~~~<~~~<~<~<<~<<<~<<~<_                          
                          ~~~<~<~~~<<~<~<<~<<~<<<~<<~<_                         
                         +~~~~~~<~<~<~<<~<<~<<~<~<<<<<~<                        
                        +<~<~<~<~<<<~<<<<~<<<<<<<<~<~<<~<                       
                       +~<~~<~<<<<~<<<~<~<<~<~<~<~<<<~<<~(                      
                      ~~<~<~<<<~~~~          <~~<<<~<<<~<~[                     
                     ~~<~<<<~<~<                 ~~<<~<<<<<1                    
                   <~~<~<~<<<+  -_-_-_-__-__-     ~<~~+_++~~+                   
                  <~~<~<<<~<~   __-__-__-__-___    ~<~+_---_+-                  
                 ]~~<~<<~<<~?   -__-__-__-__-_-_   <<~+_????--?                 
                ~~<<~<<~<<<<<   _-__-     +_-__-_  ~<~+_??]]]??]                
               -<<~<~<<<<~<~<   __-__       _-__-_  ~<+_-]]]][]][               
              }~~<~<<~<~<<<~<   -__-_        _-__-  ~~~_??][[}}[[[              
             +~<<~<<<<<<~<~<<   _-_-_        __-__- +<+_?][}11{{}[}             
            +~<<~<<~<~<~<<<<-   -___-        _-_-__ _~+-?]}{1)111}}[            
           _<<<~<<<<~<<<<~<~_   _-_-_        -___-_ _~+-][{)))())1{}}&          
          +<~<<<<~<<<<~<~<<<~   __-__        -_-__- r+-?[{)()(()())1{{          
         ~<<<~<~<<~<~<<<<<~<<   -__-_        __-_-_ {_?}1)()(((|||(|())$        
        ~<~<~<<<~<<<<~<~<~<~<   _-__-        -__-_-  ]{{1))()||||tttftttx       
       ~<<<<<<~<<<~<~<<<<<~~    _-_-_       __-___   }}}}{{1)(||tfrrxnxxrY      
      <<~<~<~<<~<<<~<~+~U       -___-      -_-_-_?     <}{}}{1(|tjxuvcczcv      
     ~<~<<<<<~<<~+_             _-_-__-_-___-___-            |)|/frnvXYUYXXX    
   ?<<<<~<~~~+                  __-__-_-_-_-__-|                  xnvcXUJUYXC   
  ~<~<~<~~                      _-__-_____-__~                        YXXYXzcv  
 +<~<+<                          <____-__-                               QYuxjf 
~~+                                                                          t((

EOF

# SCREEN-RESOLUTION

#chmod +rwx '/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/usr/local/bin/damos-screen'

# SYSTEM_EXIT

cat <<-EOF> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/bin/SYSTEM_EXIT
exec 0<&-
EOF

chmod +x /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/damos/bin/SYSTEM_EXIT
RECALL_PWD
}

function RECALL_PWD (){
D_PWD=$(grep 'DAMOS_PWD' /data/data/com.termux/files/home/.damos-record.tmp | cut -d "=" -f 2)
cd ${D_PWD}
rm -rf /data/data/com.termux/files/home/.damos-record.tmp
proot-distro login damos --shared-tmp --fix-low-ports --no-sysvipc
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
printf ${G}'_________________________/DAM.OS-INSTALLER\_________/Damian-Wuorio\_\n'${W}
}

function BANNER_RCM (){
printf ${R}'####################################################################\n'
printf ${R}'##                                                                ##\n'
printf ${R}'##  8888888b.                              .d88888b.   .d8888b.   ##\n'
printf ${R}'##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##\n'
printf ${R}'##  888    888                            888     888 Y88b.       ##\n'
printf ${R}'##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##\n'
printf ${R}'##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##\n'
printf ${R}'##  888    888 .d888888 888  888  888     888     888       "888  ##\n'
printf ${R}'##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##\n'
printf ${R}'##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##\n'
printf ${R}'##                                                                ##\n'
printf ${R}'####################################################################\n'
printf ${R}'_________________________/RECOVERY-MODE\____________/Damian-Wuorio\_\n'${W}
}

VERIFY_USER_USE