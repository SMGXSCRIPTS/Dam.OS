#!/data/data/com.termux/files/usr/bin/bash -e

# This is The Installer Script for Dam.OS v2.06 BlackDiamond
## THIS PROGRAM SCRIPT IS PROPERTY OF DAM.OS ##

# TERMINAL-COLORS
GR="$(printf '\033[1;30m')"
P="$(printf '\033[1;35m')"
R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
W="$(printf '\033[1;37m')"
C="$(printf '\033[1;36m')"
B="$(printf '\033[1;34m')"

function STARTUP (){
#DAMOS_ECHO_VERBOSE=${DAMOS_ECHO_VERBOSE=ENABLED_VERBOSE_0x200}
#DAMOS_ECHO_VERBOSE=${DAMOS_ECHO_VERBOSE_ENABLED_VERBOSE_0x100}
clear
BANNER_VF
case $STORAGE_CHECK in
    TRUE ) echo;;
    FALSE ) echo; echo ${R}"Warning! ${Y}It Is Advised To Have At Least 7GB of Storage"${W}; echo ${Y}"You Have${R} ${FIXED_DF_VAR}B"${W}; echo;;
    * ) echo ${R}"ERROR! ${Y}Storage Check Statistics Not Available!"${W};;
esac
unset FIXED_DF_VAR
unset STORAGE_ALLOW_2
unset STORAGE_SPACE
unset DF_CHECK
read -p ${Y}"Do You Wish To Install Dam.OS Softwares? ${W}[Y/N]: " INSTALL_PROCEED_YN_VAR
case $INSTALL_PROCEED_YN_VAR in
    [yY] ) echo ${G}"Running Setup..."${W}; sleep 0.4; INSTALL_SETUP;;
    [nN] ) echo ${R}"Exitting..."${W}; sleep 1.4; clear; exit;;
    "RCM" ) echo ${B}"Launching RCM..."${W}; sleep 1; RCM_STARTUP;;
    * ) echo ${R}"ERROR! ${Y}Invalid Response"${W}; sleep 1.2; DF_CHECKER;;
esac
}

function SYSTEM_ARCH_CHECK (){
SYSTEM_ARCHITECTURE=$(dpkg --print-architecture)
PRINT_SYS_ARCH=${SYSTEM_ARCHITECTURE}
case $PRINT_SYS_ARCH in
    aarch64 ) DF_CHECKER;;
    * ) SYSTEM_ARCH_CHECK_FAIL;;
esac
}

function SYSTEM_ARCH_CHECK_FAIL (){
clear
BANNER_HAULT
echo
echo ${W}"YOUR SYSTEM INSTALL HAS BEEN HAULTED"
echo
echo ${W}"Reason:"
echo ${W}"You Are Trying To Install An Arm64 Only Version Of Dam.OS"
echo ${W}"On A None Arm64 Architecture CPU"
echo
echo ${W}"DAMOS_SYS_ERROR: SYS_HAULT_0x200"
echo
NUMBER=60
HAULT_COUNTDOWN
}

function HAULT_COUNTDOWN (){
if [ "$NUMBER" == 0 ]; then printf '\033[1A'; printf '\033[K'; else printf '\033[1A'; printf '\033[K'; echo ${W}"System Available in ${NUMBER}..."; sleep 1; NUMBER=$(expr ${NUMBER} - 1); HAULT_COUNTDOWN; fi
}

DAMOS_ECHO_VERBOSE=${DAMOS_ECHO_VERBOSE=DISABLED}
function DF_CHECKER (){
DF_CHECK=$(df -h | grep "/storage/emulated" | awk '{print $4}')
FIXED_DF_VAR=${DF_CHECK}
if [[ ${FIXED_DF_CHECK} == *@(K|M)* ]]; then STORAGE_ALLOW_2="FALSE"; else STORAGE_ALLOW_2="TRUE"; fi
case $STORAGE_ALLOW_2 in
    TRUE ) STORAGE_CHECK="TRUE"; DF_CHECKER_2;;
    FAlSE ) STORAGE_CHECK="FALSE"; STARTUP;;
    * ) echo ${R}"ERROR! ${Y}Cannot Perform System Storage Check"${W}; echo "exitting..."; sleep 1.4; exit;;
esac
}

function DF_CHECKER_2 (){
STORAGE_SPACE=$(echo ${FIXED_DF_VAR} | cut -d "G" -f 1)
if [[ ${STORAGE_SPACE} < 7 ]]; then STORAGE_CHECK="FALSE" ; else STORAGE_CHECK="TRUE" ; fi
STARTUP
}

function INSTALL_SETUP (){
C_PWD=$(pwd)
DAMOS_RECORDED_PWD=${C_PWD}
clear
BANNER_VF
echo
echo ${G}"DAM.OS Desktop Environments"
echo ${R}"Be Advised The GNOME GUI Is Not Properly Supported in Dam.OS's"
echo ${R}"Current State Without init.d Or systemd"
echo ${R}"Which Are Not Possible Without Special Softwares, You May Run Into"
echo ${R}"Issues Or Huge Lag Spikes On Low Powered Devices."${W}
echo
echo ${Y}"Desktops:"
echo ${C}"KDE Plasma [${W}1${C}] ${R}- Heavy ${B}- 5.3GB${W}"
echo ${C}"LXDE [${W}2${C}] ${G}- Light -- Recommended ${B}- 3GB${W}"
echo ${C}"XFCE [${W}3${C}] ${G}- Light -- Recommended ${B}- 2.8GB${W}"
echo ${C}"LXQT [${W}4${C}] ${Y}- Semi-Light -- Not Recommended ${B}- 603MB${W}"
echo ${C}"MATE [${W}5${C}] ${Y}- Medium ${B}- 3.3GB"
echo ${C}"GNOME [${W}6${C}] ${R}- Very Heavy -- Not Recommended ${B}- 3.6GB${W}"
echo ${C}"Cinnamon [${W}7${C}] ${G}- Light ${B}- 5.4GB${W}"
echo ${C}"No GUI, Only CLI [${W}8${C}] ${G}- Very Light ${B}- Around 500MB${W}"
echo ${G}"You Have ${B}$(df -h | grep "/storage/emulated" | awk '{print $4}')B ${G}Available On Your Device's Main Storage"
echo
read -p ${C}"Pick A GUI Desktop [${G}#1-8${C}]: "${W} damos_gui_install_choice
case $damos_gui_install_choice in
    1 ) GUI_CHOICE="KDE"; INSTALL_SETUP_1_2;;
    2 ) GUI_CHOICE="LXDE"; INSTALL_SETUP_1_2;;
    3 ) GUI_CHOICE="XFCE"; INSTALL_SETUP_1_2;;
    4 ) GUI_CHOICE="LXQT"; INSTALL_SETUP_1_2;;
    5 ) GUI_CHOICE="MATE"; INSTALL_SETUP_1_2;;
    6 ) GUI_CHOICE="GNOME"; INSTALL_SETUP_1_2;;
    7 ) GUI_CHOICE="CINN"; INSTALL_SETUP_1_2;;
    8 ) GUI_CHOICE="CLI"; INSTALL_SETUP_1_2;;
    * ) echo ${R}"Invalid Response!"${W}; sleep 1.4; clear; INSTALL_SETUP;;
esac
}

function INSTALL_SETUP_1_2 (){
clear
BANNER_VF
echo
echo
echo ${G}"Select Video Protocol:"${W}
echo ${P}"[${W}1${P}] Termux-X11"${W}
echo ${P}"[${W}2${P}] VNC Server"${W}
read -p "[#1-2]: " VIDEO_PRT
case $VIDEO_PRT in
    1 ) DAMOS_VIDEO_PRT=TERMUX_X11 ; INSTALL_SETUP_2;;
    2 ) DAMOS_VIDEO_PRT=VNC_SERVER ; INSTALL_SETUP_2;;
    * ) echo ${R}"ERROR! ${Y}Invalid Response, ${R}Resetting..."${W}; sleep 0.7; INSTALL_SETUP_1_2;;
esac
}

function INSTALL_SETUP_2 (){
clear
BANNER_VF
echo
echo ${C}"Programming IDE's"
read -p ${C}"Do You Want To Install JetBrains PyCharm? ${G}[Y/N]:${W} " PYCHARM_IDE_CHOICE
case $PYCHARM_IDE_CHOICE in
    [yY] ) INSTALL_PYCHARM="TRUE";;
    [nN] ) INSTALL_PYCHARM="FALSE";;
    * ) echo ${R}"ERROR! ${Y}PyCharm Invalid Selection, ${R}Resetting..."${W}; sleep 1; INSTALL_SETUP_2;;
esac
read -p ${C}"Do You Want To Install JetBrains Rider ${G}[Y/N]:${W} " RIDER_IDE_CHOICE
case $RIDER_IDE_CHOICE in
    [yY] ) INSTALL_RIDER="TRUE";;
    [nN] ) INSTALL_RIDER="FALSE";;
    * ) echo ${R}"ERROR! ${Y}Rider Invalid Selection, ${R}Resetting..."${W}; sleep 1; INSTALL_SETUP_2;;
esac
read -p ${C}"Do You Want To Install Microsoft Visual Studio ${G}[Y/N]:${W} " MS_VS_IDE_CHOICE
case $MS_VS_IDE_CHOICE in
    [yY] ) INSTALL_MS_VSCODE="TRUE"; INSTALL_SETUP_3;;
    [nN] ) INSTALL_MS_VSCODE="FALSE"; INSTALL_SETUP_3;;
    * ) echo ${R}"ERROR! ${Y}Microsoft Visual Studio Invalid Selection, ${R}Resetting..."${W}; sleep 1; INSTALL_SETUP_2;;
esac
}

function INSTALL_SETUP_3 (){
clear
BANNER_VF
echo
echo ${R}"Please Note Only Popular Languages are Listed."${W}
echo ${R}"You Need To Use gcc With -lstdc++ to compile to C++"${W}
echo ${R}"Or Use g++ with base-devel."${W}
echo
echo ${G}"Select Programming Languages:"${W}
echo ${C}"[${W}1${C}] ${R}All -- Python Ruby"${W}
echo ${C}"[${W}2${C}] ${R}Majority -- Python Tcl C/C++ php "${W}
echo ${C}"[${W}3${C}] ${Y}Medium -- Python Tcl C/C++"${W}
echo ${C}"[${W}4${C}] ${G}Some -- Python Tcl C/C++"${W}
echo ${C}"[${W}5${C}] ${G}Default -- Python"${W}
read -p ${C}"Select [${G}#1-5${C}]:${W} " PRGL_CHOICE
case $PRGL_CHOICE in
    1 ) USER_SELECTED_PRGL="ALL"; USER_SETUP_CREDS;;
    2 ) USER_SELECTED_PRGL="MAJORITY"; USER_SETUP_CREDS;;
    3 ) USER_SELECTED_PRGL="MEDIUM"; USER_SETUP_CREDS;;
    4 ) USER_SELECTED_PRGL="SOME"; USER_SETUP_CREDS;;
    5 ) USER_SELECTED_PRGL="DEFAULT"; USER_SETUP_CREDS;;
    * ) echo ${R}"ERROR! ${Y}Invalid Response, ${R}Resetting..."${W}; sleep 1; INSTALL_SETUP_3;;
esac
}

function USER_SETUP_CREDS (){
clear
BANNER_VF
echo
echo ${W}"Setup Main System User"
read -p ${W}"Username: " DAMOS_UNAME
USER_SETUP_CREDS_PASSWD
}

function USER_SETUP_CREDS_PASSWD (){
read -p ${W}"Password: " DAMOS_PASSWD1
read -p ${W}"Verify Password: " DAMOS_PASSWD2
if [ "${DAMOS_PASSWD1}" != "${DAMOS_PASSWD2}" ]; then echo ${R}"ERROR! ${Y}Passwords Do Not Match!"${W}; echo; USER_SETUP_CREDS_PASSWD; else INSTALL_MAIN_VERIFY; fi
}

function INSTALL_MAIN_VERIFY (){
clear
BANNER_VF
echo
echo ${G}"All Dam.OS Variables Have Been Selected!"${W}
read -p ${Y}"Are You Ready To Install Dam.OS? ${W}[Y/N]: " INSTALL_SYSTEM
case $INSTALL_SYSTEM in
    [yY] ) echo ${C}"Running Install..."${W}; sleep 0.7; INSTALL_MAIN;;
    [nN] ) echo ${R}"Exitting..."${W}; sleep 0.7; UNSET_ALL_INSTALL_VARS; exit;;
    * ) echo ${R}"ERROR! ${Y}Invalid Response, ${R}Resetting..."${W}; sleep 1; INSTALL_MAIN_VERIFY;;
esac
}

function INSTALL_MAIN (){
clear
BANNER_VF
echo
echo ${G}"Updating System Packages..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) pkg update -y; pkg install sl sed tar wget curl proot sox play-audio -y; pkg clean;;
    ENABLED_VERBOSE_0x100 ) pkg update -y; pkg install sl sed tar wget curl proot sox play-audio-y; pkg clean;;
    * ) pkg update -y &> /dev/null ; pkg install sed tar wget curl proot sox play-audio -y &> /dev/null ; pkg clean &> /dev/null;;
esac
if [[ ! -d /data/data/com.termux/files/usr/var/damos ]]; then mkdir /data/data/com.termux/files/usr/var/damos ; fi
cd /data/data/com.termux/files/usr/var/damos
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Installing Dam.OS Root FileSystem..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) wget --debug https://github.com/SMGXSCRIPTS/Dam.OS/releases/download/Rootfs/damos-arm64-rootfs.tar.xz;;
    ENABLED_VERBOSE_0x100 ) wget https://github.com/SMGXSCRIPTS/Dam.OS/releases/download/Rootfs/damos-arm64-rootfs.tar.xz;;
    * ) wget -nv https://github.com/SMGXSCRIPTS/Dam.OS/releases/download/Rootfs/damos-arm64-rootfs.tar.xz &> /dev/null;;
esac
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Extracting Dam.OS Rootfs..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) tar -xvf /data/data/com.termux/files/usr/var/damos/damos-arm64-rootfs.tar.xz;;
    ENABLED_VERBOSE_0x100 ) tar -xvf /data/data/com.termux/files/usr/var/damos/damos-arm64-rootfs.tar.xz;;
    * ) tar -xf /data/data/com.termux/files/usr/var/damos/damos-arm64-rootfs.tar.xz &> /dev/null;;
esac
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Erasing Dam.OS Rootfs Compressed File..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) rm -rvf /data/data/com.termux/files/usr/var/damos/damos-arm64-rootfs.tar.xz;;
    ENABLED_VERBOSE_0x100 ) rm -rvf /data/data/com.termux/files/usr/var/damos/damos-arm64-rootfs.tar.xz;;
    * ) rm -rvf /data/data/com.termux/files/usr/var/damos/damos-arm64-rootfs.tar.xz &> /dev/null;;
esac
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Writing Launch Command File..."${W}
WRITE_DAMOS_LAUNCH
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Setting Up FileSystem..."${W}
echo ${Y}"This May Take A While..."${W}
INSTALL_SETUP_FINISH
}

function WRITE_DAMOS_LAUNCH (){
if [[ -f /data/data/com.termux/files/usr/bin/damos ]]; then rm -rf /data/data/con.termux/files/usr/bin/damos ; else false; fi
if [[ -f /data/data/com.termux/files/usr/var/damos/DAMOS_SYSTEM_STARTUP.sh ]]; then rm -rf /data/data/con.termux/files/usr/var/damos/DAMOS_SYSTEM_STARTUP.sh ; else false; fi
}

function INSTALL_SETUP_FINISH (){
echo ${DAMOS_UNAME} >> /data/data/com.termux/files/usr/var/damos/DAMOS_ARM64_ROOTFS/usr/lib/damos-system/config.dmf
echo ${DAMOS_PASSWD1} >> /data/data/com.termux/files/usr/var/damos/DAMOS_ARM64_ROOTFS/usr/lib/damos-system/config.dmf
case $GUI_CHOICE in
    "KDE" ) false;;
    "LXDE" ) false;;
    "XFCE" ) false;;
    "LXQT" ) false;;
    "MATE" ) false;;
    "GNOME" ) false;;
    "CINN" ) false;;
    "CLI" ) false;;
    * ) echo ${R}"ERROR! ${Y}Invalid GUI Key Selected"${W}; sleep 1; clear; exit;;
esac
case $USER_SELECTED_PRGL in
    ALL ) false;;
    MAJORITY ) false;;
    MEDIUM ) false;;
    SOME ) false;;
    DEFAULT ) false;;
    * ) echo ${R}"ERROR! ${Y}Invalid PRGL Key Selected"${W}; sleep 1; clear; exit;;
esac
case $INSTALL_PYCHARM in
    TRUE ) PYCHARM_SCRIPT;;
    FALSE ) false;;
    * ) echo ${R}"ERROR! ${Y}Invalid PyCharm Key Selection"${W}; sleep 0.4; echo ${R}"Skipping..."${W}; sleep 0.7; false;;
esac
case $INSTALL_RIDER in
    TRUE ) RIDER_SCRIPT;;
    FALSE ) false;;
    * ) echo ${R}"ERROR! ${Y}Invalid Rider Key Selection"${W}; sleep 0.4; echo ${R}"Skipping..."${W}; sleep 0.7; false;;
esac
case $INSTALL_MS_VSCODE in
    TRUE ) INSTALL_MS_VSCODE;;
    FALSE ) false;;
    * ) echo ${R}"ERROR! ${Y}Invalid PyCharm Key Selection"${W}; sleep 0.4; echo ${R}"Skipping..."${W}; sleep 0.7; false;;
esac
START_SYSTEM_INSTALLER
UNSET_ALL_INSTALL_VARS
}

DAMOS_ROOTFS_PREFIX='/data/data/com.termux/files/usr/var/damos/DAMOS_ARM64_ROOTFS'
function START_SYSTEM_INSTALLER (){
unset LD_PRELOAD
CHROOT_COMMAND="proot"
CHROOT_COMMAND+=" --link2symlink"
CHROOT_COMMAND+=" --kill-on-exit"
CHROOT_COMMAND+=" -0"
CHROOT_COMMAND+=" -r ${DAMOS_ROOTFS_PREFIX}"
CHROOT_COMMAND+=" -b /dev"
CHROOT_COMMAND+=" -b /proc"
CHROOT_COMMAND+=" -b ${DAMOS_ROOTFS_PREFIX}/root:/dev/shm"
CHROOT_COMMAND+=" -w /root"
CHROOT_COMMAND+=" /usr/bin/env -i"
CHROOT_COMMAND+=" HOME=/root"
CHROOT_COMMAND+=" LANG=en_US.UTF-8"
CHROOT_COMMAND+=" PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/games:/usr/local/games"
CHROOT_COMMAND+=" DAMOS_INSTALL_SYSTEM=SYSKEY_0x0"
CHROOT_COMMAND+=" TERM=$TERM"
CHROOT_COMMAND+=" /usr/bin/bash /usr/lib/damos-system/SETUP_GUI/DAMOS_GUI_WIZARD.sh"
${CHROOT_COMMAND}
}

OVERRIDE_DAMOS_RCM=${OVERRIDE_DAMOS_RCM=0}
OVERRIDE_DAMOS_RCM_STO_CHECK=${OVERRIDE_DAMOS_RCM_STO_CHECK=0}
function RCM_STARTUP (){
clear
BANNER_RCM
echo
echo ${C}"Checking System Loader..."${W}
sleep 2
case $OVERRIDE_DAMOS_RCM in
    1 ) printf '\033[1A'; printf '\033[K'; echo ${Y}"The Recovery Mode Is Unlocked"${W}; read -p ${R}"Are You Sure You Want To Proceed To RCM? ${W}[Y/N]: " RCM_CHOICE ; RCM_CHOICE_PICKER;;
    * ) printf '\033[1A'; printf '\033[K'; echo ${Y}"The Recovery Mode Is Currently Locked"${W}; echo ${R}"Exitting..."${W}; sleep 1.2; DF_CHECKER;;
esac
}

function RCM_CHOICE_PICKER (){
case $RCM_CHOICE in
    [yY] ) echo ${C}"Checking RCM Integrity..."; sleep 0.7; RCM_INTEGRITY_CHECK;;
    [nN] ) echo ${R}"Exitting..."${W}; sleep 1; clear; exit;;
    * ) echo ${R}"ERROR! ${Y}Invalid Choice, ${R}Resetting..."${W}; sleep 1; DF_CHECKER;;
esac
}

function RCM_INTEGRITY_CHECK (){
if [[ -d /data/data/com.termux/files/usr/var/damos/DAMOS_RCM_ARM64_ROOTFS ]]; then RCM_LAUNCH; else INSTALL_DAMOS_RCM; fi
}

function INSTALL_DAMOS_RCM (){
clear
BANNER_RCM
echo
echo ${Y}"Dam.OS RCM Does Not Appear to Be Installed"${W}
read -p ${G}"Do You Wish To Install Dam.OS RCM? ${W}[Y/N]: " RCM_INSTALL_PICKER
case $RCM_INSTALL_PICKER in
    [yY] ) echo ${G}"Running RCM Installer..."; sleep 1; DAMOS_RCM_INSTALL;;
    * ) echo ${R}"ERROR! ${Y}Invalid Choice, ${R}Resetting..."; sleep 0.7; INSTALL_DAMOS_RCM;;
esac
}

function DAMOS_RCM_INSTALL (){
printf '\033[1A'
printf '\033[K'
printf '\033[1A'
printf '\033[K'
echo ${G}"Updating System Packages..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) pkg update -y; pkg install tar wget curl proot -y; pkg clean;;
    ENABLED_VERBOSE_0x100 ) pkg update -y; pkg install tar wget curl proot -y; pkg clean;;
    * ) pkg update -y &> /dev/null ; pkg install tar wget curl proot -y &> /dev/null ; pkg clean &> /dev/null;;
esac
if [[ ! -d /data/data/com.termux/files/usr/var/damos ]]; then mkdir /data/data/com.termux/files/usr/var/damos ; fi
cd /data/data/com.termux/files/usr/var/damos
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Installing Dam.OS RCM Operating System..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) wget --debug https://github.com/SMGXSCRIPTS/Dam.OS/releases/download/Rootfs/damos-rcm-arm64-rootfs.tar.xz;;
    ENABLED_VERBOSE_0x100 ) wget https://github.com/SMGXSCRIPTS/Dam.OS/releases/download/Rootfs/damos-rcm-arm64-rootfs.tar.xz;;
    * ) wget -nv https://github.com/SMGXSCRIPTS/Dam.OS/releases/download/Rootfs/damos-rcm-arm64-rootfs.tar.xz &> /dev/null;;
esac
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) echo;;
    ENABLED_VERBOSE_0x100 ) echo;;
    * ) printf '\033[1A'; printf '\033[K';;
esac
echo ${G}"Extracting RCM Rootfs..."${W}
case $DAMOS_ECHO_VERBOSE in
    ENABLED_VERBOSE_0x200 ) tar -xvf /data/data/com.termux/files/usr/var/damos/damos-rcm-arm64-rootfs.tar.xz;;
    ENABLED_VERBOSE_0x100 ) tar -xvf /data/data/com.termux/files/usr/var/damos/damos-rcm-arm64-rootfs.tar.xz;;
    * ) tar -xf /data/data/com.termux/files/usr/var/damos/damos-rcm-arm64-rootfs.tar.xz;;
esac
}

function UNSET_ALL_INSTALL_VARS (){
unset damos_gui_install_choice
unset GUI_CHOICE
unset INSTALL_RIDER
unset INSTALL_PYCHARM
unset INSTALL_MS_VSCODE
}

function BANNER_VF (){
printf ${G}'####################################################################\n'
printf ${G}'###                                                              ###\n'
printf ${G}'##  8888888b.                              .d88888b.   .d8888b.   ##\n'
printf ${G}'##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##\n'
printf ${G}'##  888    888                            888     888 Y88b.       ##\n'
printf ${G}'##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##\n'
printf ${G}'##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##\n'
printf ${G}'##  888    888 .d888888 888  888  888     888     888       "888  ##\n'
printf ${G}'##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##\n'
printf ${G}'##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##\n'
printf ${G}'###                                                              ###\n'
printf ${G}'####################################################################\n'
printf ${G}'_________________________/DAM.OS-INSTALLER\_________/Damian-Wuorio\_\n'${W}
}

function BANNER_RCM (){
printf ${R}'####################################################################\n'
printf ${R}'###                                                              ###\n'
printf ${R}'##  8888888b.                              .d88888b.   .d8888b.   ##\n'
printf ${R}'##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##\n'
printf ${R}'##  888    888                            888     888 Y88b.       ##\n'
printf ${R}'##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##\n'
printf ${R}'##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##\n'
printf ${R}'##  888    888 .d888888 888  888  888     888     888       "888  ##\n'
printf ${R}'##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##\n'
printf ${R}'##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##\n'
printf ${R}'###                                                              ###\n'
printf ${R}'####################################################################\n'
printf ${R}'_________________________/RECOVERY-MODE\____________/Damian-Wuorio\_\n'${W}
}

function BANNER_HAULT (){
printf ${R}'####################################################################\n'
printf ${R}'###                                                              ###\n'
printf ${R}'##  8888888b.                              .d88888b.   .d8888b.   ##\n'
printf ${R}'##  888  "Y88b                            d88P" "Y88b d88P  Y88b  ##\n'
printf ${R}'##  888    888                            888     888 Y88b.       ##\n'
printf ${R}'##  888    888  8888b.  88888b.d88b.      888     888  "Y888b.    ##\n'
printf ${R}'##  888    888     "88b 888 "888 "88b     888     888     "Y88b.  ##\n'
printf ${R}'##  888    888 .d888888 888  888  888     888     888       "888  ##\n'
printf ${R}'##  888  .d88P 888  888 888  888  888 d8b Y88b. .d88P Y88b  d88P  ##\n'
printf ${R}'##  8888888P"  "Y888888 888  888  888 Y8P  "Y88888P"   "Y8888P"   ##\n'
printf ${R}'###                                                              ###\n'
printf ${R}'####################################################################\n'
printf ${R}'_________________________/SYSTEM-HAULTED\_____________/Damian-Wuorio\_\n'${W}
}

SYSTEM_ARCH_CHECK