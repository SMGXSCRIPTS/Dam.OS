# Dam.OS
A Service Package for Arch Linux
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-LOGO_V2.png)

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
Dam.OS has 4 Different GUI's (Graphical Interface) including just Cli.

KDE Plasma:

![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-KDE.jpg)

LXDE:

![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-LXDE.jpg)

LXQT:

![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-LXQT.jpg)

Xfce 4:

![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-XFCE4.jpg)

MATE:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-MATE.jpg)

CLi:

![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-CLI_ONLY.jpg)

# Install/Setup
Dam.OS is currently only avaliable for the Termux Application On Android Devices. To Install Dam.OS on Termux, Execute

"wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/install/DAM.OS-INSTALL_PR-DIS_TERMUX.sh ; bash DAM.OS-INSTALL_PR-DIS_TERMUX.sh"


For the Proot-Distro Version -- Recommended

"wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/install/DAM.OS-INSTALL_NO-PR-DIS_TERMUX.sh ; bash DAM.OS-INSTALL_NO-PR-DIS_TERMUX.sh"


For the Proot Version (P.S Proot is faster than Proot-Distro and is less likely to crash on Bad Hardware, but it binds itself to your Android System. So be careful if your Rooted, Also Proot-Distro will bind itself too unless you use the "--isolated" command)

# Dam.OS ASCII Banners
Normal:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/Screenshot_2023-08-11-22-44-09-838.jpg)
Recovery Mode:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/Screenshot_2023-08-11-22-54-35-551.jpg)

# Dam.OS Default Wallpapers
The Dam.OS Default Wallpapers Is Beautiful isn't It.

The Future Of ARM:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-WALLPAPER.jpg)

Preservation:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-WALLPAPER-6.jpg)

The Dam.OS Wallpaper has to be set manually so get into the DE's (Desktop Environment) Wallpaper Picker and navigate to "/etc/damos/wallpapers" and the File Name is DAM.OS-WALLPAPER.jpg

# Dam.OS Recovery Mode (RCM)
The Dam.OS RCM Mode can be Found in The Termux Installer. The Dam.OS RCM is a nifty Tool that Allows a User to Alter Certain parts of The System and it acts like a Failsafe because it Does not Boot the Dam.OS System. Allowing a User to fix Their System if they Accidently Bricked it.

To Access RCM Mode use OVERRIDE_DAMOS_RCM=1 on both of the  Installers

Example: OVERRIDE_DAMOS_RCM=1 bash DAM.OS-INSTALL_PR-DIS_TERMUX.sh
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/1.jpg)

Type RCM instead of Y or N.
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/2.jpg)

It will start Checking The Dam.OS System Loader.
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/3.jpg)

And if it works you will be Prompted with this.
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/4.jpg)

Dam.OS RCM Has its Own Command Line!

![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-RCM_CLI.jpg)

# Plans For Dam.OS
- Currently to get Dam.OS up and Running on Smoothly Bad Hardware

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
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/GL_SHOWCASE.jpg)
Replace winecfg with the Directory and Application name,
Example: gl box86 wine '/home/LinuxForLife82/Downloads/Undertale/Undertale.exe'
only put winecfg if its Dam.OS's First time Setup to change the 'Windows 7' to 'Windows 10' in order to Max out your Compatability. Before you Do the winecfg setup Run: "box64 wine64 winebuild" to setup Wine to be Able to use it.

# Termux-X11
Dam.OS Relies on Termux-X11 because it is Faster and takes less Processing Power than a VNC Server which Takes more Power and is Slower. And you are able to Download Termux-X11 Here: "https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/termux"
And Termux_118.0 Here "https://f-droid.org/en/packages/com.termux/"
You need to Allow Installing apk's from an Unknown Source

# Down Sides to Termux
Because Dam.OS is Emulated with Proot. It cannot use Applications that Relie upon init.d or systemd and systemctl Commands do not work. You Require Special Software's to Emulate systemd and init.d and for Some Reason the Package sox Does not Work So use "play-audio" which is Preinstalled Instead.

# Misc
For those of you who are wondering
Dam.OS stands for "Damian Operating System"
And it is based off of my name "Damian Wuorio"

# Fun Facts
- I began Developing Dam.OS on 3/6/2021.

- Dam.OS Originally stood for (Dynamic Advanced Machine Operating System) Before it was Changed to (Damian Operating System) in 6/8/2022

- Dam.OS Update 0.6 Was Called "OperationCheezy"

- Did you know That your Smarter than a Computer Thinking wise. Because The average Human has 92 Billion brain cells while an average Computer has 7.2 Billion Micro Transisters, Although you won't beat a Computer Knowledge wise.

# Release Date
The Dam.OS ISO file for SBC's is Planned to be Released in 3/4/2025
