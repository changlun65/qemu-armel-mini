qemu-armel-mini
===============

qemu emulator for armel (versatile express-a9)
----------------------------------------------
armel emulator will help you to verify or debug armel binary on your laptop.

This is the quick HowTo to use armel (versatile express-a9) qmeu.

1) install qemu, and make sure the qemu supports versatile express.
> sudo apt-get install qemu qemu-system

> qemu-system-arm -M ? | grep vexpress

2) extract the tarball into your directory, it includes the following files curretly.
> run-qemu-armel-mini.sh    
--> the script to run qemu-armel

> zImage-3.0.35-vexpress    
--> linux kernel compiled for vexpress config

> mini-rootfs.ext2          
--> minimal ext2 root file system. it preloaded busybox for utilities, strace, gdbserver for debgguging, and valgring for profiling.
                          
3) launch the running script, the armel emulator will startup and prompt to login.
> Welcome to Buildroot

> buildroot login: root

4) the emulator supports nfs mount, that means you could mount host directories into arm emulator.
> mount 10.0.2.2:/home/ralph/workarea/industrial/zxing/cpp/arm remotefs -o nolock

** PLEASE refer how to setup nfs server on your host.

5) after building the armel binary on host, you should be able to debug/profile it on emulator.


----------------------------------------------
linux kernel compile
toolchain install
>wget -c https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz

>tar xfv gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz

compile linux
>make CROSS_COMPILE=/mnt/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- ARCH=arm vexpress_defconfig

>make CROSS_COMPILE=/mnt/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf- ARCH=arm -j4

