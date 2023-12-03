<link rel="apple-touch-icon" sizes="180x180" href="https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-LOGO_APPLE.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-LOGO_V4_32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-V4.ico">

# Dam.OS

A Service Package for Arch Linux

![DAMOS_LOGO](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-LOGO_V4.png)

# Purpose
Dam.OS is meant to help normal users to understand the Linux CLI A.K.A the Terminal Emulator or the actual Terminal. Another purpose of Dam.OS is to use Box64 and Wine natively on ARM SBC's (Single Board Computer) or on a Phone with the Termux Application.

# Reason
The Reason I Based Dam.OS off of Arch Linux is because Arch has very low Memory Usage meaning it is Very Stable in Performance and Usability. And its Open Source Giving the User the Ability to Change the OS's code to their liking or make their own Drivers.

# Explaination
Dam.OS Uses Box64 and Wine but what are those Exactly? Well

- Box64 and Box86 are Made by ptitSeb here on Github. Box64 is a Translation For Architecture Instruction sets. For Example: Box64 will Translate x64 Instructions to ARM64 or Aarch64 Instructions because your Phones CPU Does not Understand the Language of your average Laptop or Desktop which has an x64 CPU most of the time. Box86 is essentialy the same as Box64 but with x86 to ARM Translation.

- Wine is made by a team of Linux Lovers and their Website is "https://www.winehq.org/". Wine is not an Emulator, It is a Compatibility layer That Recreates a Windows Environment File System for .exe .msi .dll files or other Windows Programs. Wine Does all of this without losing any Performance. Dam.OS adds DXVK 2.0 and other Software's to Wine to help it Game Better.

- gl is the Alias for the virglrenderer-android Package. Virgl is the Software Dam.OS and Many other QEMU (Quick Emulation) Systems use to get 3D GPU acceleration. How it Works: Virgl gets instructions from The Dam.OS System on how to Build a Frame and the Logic Data behind it and uses your Phones actual GPU and GPU Drivers, You are Garenteed fast OpenGL Performance also since Dam.OS is Binded to Termux's /tmp partion, Virgl can simply send the Frames over it like a Bus and then Dam.OS puts those Frames in order in a Window on the Window Manager.

# Dam.OS Graphical Interface
Dam.OS has 6 Different GUI's (Graphical Interface) including just Cli.

KDE Plasma:
![DAMOS_KDE_PLASMA](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-KDE.jpg)

LXDE:
![DAMOS_LXDE](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-LXDE.jpg)

LXQT:
![DAMOS_LXQT](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-LXQT.jpg)

Xfce 4:
![DAMOS_XFCE4](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-XFCE4.jpg)

MATE:
![DAMOS_MATE](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-MATE.jpg)

Cinnamon:
![DAMOS_CINNAMON](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-CINNAMON.jpg)

CLi:

![DAMOS_CLI](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-CLI_ONLY.jpg)

(P.S. The Cinnamon GUI is Currently Experimental and may not Work Properly in Dam.OS)

# Install/Setup
Dam.OS is currently only avaliable for the Termux Application On Android Devices. To Install Dam.OS on Termux, Execute:
```
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/install/DAM.OS-INSTALL_PR-DIS_TERMUX.sh; bash DAM.OS-INSTALL_PR-DIS_TERMUX.sh
```

For the Proot-Distro Version -- Recommended:
```
wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/install/DAM.OS-INSTALL_PR_TERMUX.sh; bash DAM.OS-INSTALL_NO-PR-DIS_TERMUX.sh
```

For the Proot Version (P.S Proot is faster than Proot-Distro and is less likely to crash on Bad Hardware, but it binds itself to your Android System. So be careful if your Rooted, Also Proot-Distro will bind itself too unless you use the "--standalone, -s" Arguement in the Launch Command)

# Dam.OS ASCII Banners
Normal:

![NORMAL_DAMOS](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/Screenshot_2023-08-11-22-44-09-838.jpg)

Recovery Mode:

![RCM_DAMOS](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/Screenshot_2023-08-11-22-54-35-551.jpg)

# Dam.OS Default Wallpapers
The Dam.OS Default Wallpapers Is Beautiful Arent They.

The Future Of ARM:

![THE_FUTURE_OF_ARM](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER.jpg)
Made For Samsung Dex Or Other Android Desktops. Example: 1920x1080, 1920x1200

Preservation:

![PRESERVATION](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-WALLPAPER-6.jpg)
Made For Normal Phone Use. Example: 2220x1080, 1440x720

The Dam.OS Wallpaper has to be set manually so get into the DE's (Desktop Environment) Wallpaper Picker and navigate to "/etc/damos/wallpapers" and the File Name is DAM.OS-WALLPAPER.jpg

# Dam.OS Recovery Mode (RCM)
The Dam.OS RCM Mode can be Found in The Termux Installer. The Dam.OS RCM is a nifty Tool that Allows a User to Alter Certain parts of The System and it acts like a Failsafe because it Does not Boot the Dam.OS System. Allowing a User to fix Their System if they Accidently Bricked it.

To Access RCM Mode use OVERRIDE_DAMOS_RCM=1 on both of the  Installers

Example:
```
OVERRIDE_DAMOS_RCM=1 bash DAM.OS-INSTALL_PR-DIS_TERMUX.sh
```
![RCM_EX_1](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/1.jpg)

Type RCM instead of Y or N.

![RCM_EX_2](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/2.jpg)

It will start Checking The Dam.OS System Loader.

![RCM_EX_3](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/3.jpg)

And if it works you will be Prompted with this.

![RCM_EX_4](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/4.jpg)

Dam.OS RCM Has its Own Command Line!

![RCM_CLI](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/lib/DAM.OS-RCM_CLI.jpg)

Dam.OS RCM Runs In a Container So That The User does not Mess With Their Internal Android System! (P.S This Only Applies to Dam.OS 2.06 BlackDiamond) And only when You Use.
```
damos --export RCM_CLI
```
Inside of the Dam.OS RCM Command Line.
# Plans For Dam.OS
- Currently to get Dam.OS up and Running Smoothly on Bad Hardware

- Make a Package Manager For Dam.OS

- Make Dam.OS a Live Boot .ISO On Flash Drives For x86_64 Machines

- Give Dam.OS more Default Wallpapers

- Give Dam.OS Better Support for Games and Basic Applications such as Linux or MS-DOS (Windows)

- Implement The Dam.OS Voice Module into Arch

- Implement Bluetooth Passthrough to Dam.OS in Termux

- Implement Wi-Fi Passthrough to Dam.OS in Termux

- Implement Microphone Passthrough to Dam.OS in Termux

- Emulate systemd and init.d with Special Software

- Improve Dam.OS Based on your Guy's feedback

# Box64 and Wine Use Case
![WINE_BOX64](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/random/GL_SHOWCASE.jpg)

Replace winecfg with the Directory and Application name,
```
gl box86 wine '/home/LinuxForLife82/Downloads/Undertale/Undertale.exe'
```
Or
```
zink box86 wine '/home/LinuxForLife82/Downloads/Undertale/Undertale.exe'
```
It Depends on Your Config For either 'gl' or 'zink' Which can be Changed at Any Time With,
```
damos --config=zink
damos --config=gl
```
In Termux.

only put winecfg if its Dam.OS's First time Setup to change the 'Windows 7' to 'Windows 10' in order to Max out your Compatability. Before you Do the winecfg setup Run:
```
box64 wine64 winebuild
```
to setup Wine to be Able to use it.
Or Use,
```
damos-wine --reset
```
In Dam.OS for an Automated Install Process.

# Termux-X11
Dam.OS Relies on Termux-X11 because it is Faster and takes less Processing Power than a VNC Server which Takes more Power and is Slower. And you are able to Download [Termux-X11 Here.](https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/termux/Termux-X11_ARM64.apk)
And [Termux_118.0 Here.](https://f-droid.org/repo/com.termux_118.apk)
You need to Allow Installing apk's from an Unknown Source

# Down Sides to Termux
Because Dam.OS is Emulated with Proot. It cannot use Applications that Rely upon init.d or systemd and systemctl Commands do not work. You Require Special Software's to Emulate systemd and init.d and for Some Reason the Package sox Does not Work So use "play-audio" Which is Preinstalled Instead.

# Misc
For those of you who are wondering
Dam.OS stands for "Damian Operating System"
And it is based off of my name "Damian Wuorio"

# Fun Facts
- I began Developing Dam.OS on 3/6/2021.

- Dam.OS Originally stood for (Dynamic Advanced Machine Operating System) Before it was Changed to (Damian Operating System) in 6/8/2022

- Dam.OS Update 0.6 Was Called "OperationCheezy"

- Dam.OS Update 1.22 Was Called "Shovel"

- Did you know That your Smarter than a Computer Thinking wise. Because The average Human has 92 Billion brain cells while an average Computer has 7.2 Billion Micro Transisters, Although you won't beat a Computer Knowledge wise. It has a very good Memory

# Release Date
The Dam.OS ISO file for SBC's is Planned to be Released in 3/4/2025
