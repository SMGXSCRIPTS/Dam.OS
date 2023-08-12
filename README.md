# Dam.OS
A Service Package for Arch Linux

# Purpose
Dam.OS is meant to help normal users to understand the Linux CLI A.K.A the Terminal Emulator or the actual Terminal. Another purpose of Dam.OS is to use Box64 and Wine natively on ARM SBC's (Single Board Computer) or on a Phone with the Termux Application.

# Reason
The Reason I Based Dam.OS off of Arch Linux is because Arch has very low Memory Usage meaning it is Very Stable in Performance and Useability. And its Open Source Giving the User the Ability to Change the OS's code to their liking or make their own Drivers.

# Explanation
Dam.OS Uses Box64 and Wine but what are those Exactly? Well

- Box64 and Box86 are Made by ptitSeb here on Github. Box64 is a Translation For Architecture Instruction sets. For Example: Box64 will Translate x64 Instructions to ARM64 or Aarch64 Instructions because your Phones CPU Does not Understand the Language of your average Laptop or Desktop which has an x64 CPU most of the time. Box86 is essentialy the same as Box64 but with x86 to ARM Translation.

- Wine is made by a team of Linux Lovers and their Website is "https://www.winehq.org/". Wine is not an Emulator, It is a Compatibility layer That Recreates a Windows Environment File System for .exe .msi .dll files or other Windows Programs. Wine Does all of this without losing any Performance. Dam.OS adds DXVK 2.0 and other Software's to Wine to help it Game Better.

- gl is the Alias for the virglrenderer-android Package. Virgl is the Software Dam.OS and Many other QEMU (Quick Emulation) Systems use to get 3D GPU acceleration. How it Works: Virgl gets instructions from The Dam.OS System on how to Build a Frame and the Logic Data behind it and uses your Phones actual GPU and GPU Drivers, You are Garenteed fast openGL Performance also since Dam.OS is Binded to Termux's /tmp partion, Virgl can simply send the Frames over it like a Bus and then Dam.OS puts those Frames in order in a Window on the Window Manager.

# Install/Setup
Dam.OS is currently only avaliable for the Termux Application On Android Devices. To Install Dam.OS on Termux, Execute

"wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/install/DAM.OS-INSTALL_PR-DIS_TERMUX.sh"
For the Proot-Distro Version -- Recommended

"wget https://github.com/SMGXSCRIPTS/Dam.OS/raw/main/install/DAM.OS-INSTALL_NO-PR-DIS_TERMUX.sh"
For the Proot Version (P.S Proot is faster than Proot-Distro and is less likely to crash on Bad Hardware, but it binds itself to your Android System. So be careful if your Rooted, Also Proot-Distro will bind itself too unless you use the "--isolated" command)

# Dam.OS ASCII Banners
Normal:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/Screenshot_2023-08-11-22-44-09-838.jpg)
Recovery Mode:
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/Screenshot_2023-08-11-22-54-35-551.jpg)

# Dam.OS Default Wallpaper
The Dam.OS Default Wallpaper Is Beautiful isn't It
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/lib/DAM.OS-WALLPAPER.jpg)

The Dam.OS Wallpaper has to be set manually so get into the DE's (Desktop Environment) Wallpaper Picker and navigate to "/etc/damos/wallpapers" and the File Name is DAM.OS-WALLPAPER.jpg

# Dam.OS Recovery Mode (RCM)
The Dam.OS RCM Mode can be Found in The Termux Installer. The Dam.OS RCM is a nifty Tool that Allows a User to Alter Certain parts of The System and it acts like a Failsafe because it Does not Boot the Dam.OS System. Allowing a User to fix Their System if they Accidently Bricked it.

# Plans For Dam.OS
- Currently to get Dam.OS up and Running on Smoothly Bad Hardware

- Make a Package Manager For Dam.OS

- Make Dam.OS a Live Boot .ISO On Flash Drives For x86_64 Machines

- Give Dam.OS more Default Wallpapers

- Give Dam.OS Better Support Games and Basic Applications such as Linux or MS-DOS (Windows)

- Improve Dam.OS Based on your Guy's feedback

# Box64 and Wine Use Case
![alt text](https://github.com/SMGXSCRIPTS/Dam.OS/blob/main/random/GL_SHOWCASE.jpg)
Replace winecfg with the Directory and Application name,
Example: gl box86 wine '/home/LinuxForLife82/Downloads/Undertale/Undertale.exe'
only put winecfg if its Dam.OS's First time Setup to change the 'Windows 7' to 'Windows 10' in order to Max out your Compatability. Before you Do the winecfg setup Run: "box64 wine64 winebuild" to setup Wine to be Able to use it.

# Termux-X11
Dam.OS Relies on Termux-X11 because it is Faster and takes less Processing Power than a VNC Server which Takes more Power and is Slower. And you are able to Download Termux-X11 Here: "https://github/SMGXSCRIPTS/Dam.OS/blob/main/termux"
And Termux_118.0 Here "https://f-droid.org/en/packages/com.termux/"
You need to Allow Installing apk's from an Unknown Source

# Down Sides to Termux
Because Dam.OS is Emulated with Proot. It cannot use Applications that Relie upon init.d or systemd and systemctl Commands do not work. You Require Special Software's to Emulate systemd and init.d

# Misc
For those of you who are wondering
Dam.OS stands for "Damian Operating System"
And it is based off of my name "Damian Wuorio"

# Release Date
Dam.OS is Planned to be Released in 3/4/2025
