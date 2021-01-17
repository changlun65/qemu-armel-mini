#!/bin/bash

# versatilepb booted with hda, kernel 2.6 with scsi disk support
#qemu-system-arm -M versatilepb \
    #-m 128M \
    #-kernel zImage-2.6.25-versatile \
    #-hda mini-rootfs-2.6.ext2 \
    #-append "root=/dev/sda console=tty1 console=ttyAMA0" \
    #-net nic -net user \
    #-nographic

# vexpress booted with sd, kernel 3.x
# -redir tcp:5039::5039  --> TCP port 5039 on the host is redirected to the guest's port 5039
#qemu-system-arm -M vexpress-a9 \
#                -cpu cortex-a9 \
#                -m 128M \
#                -kernel zImage-3.0.35-vexpress \
#                -sd mini-rootfs.ext2 \
#                -append "root=/dev/mmcblk0 ro console=tty1 console=ttyAMA0" \
#                -net nic -net user \
#                -redir tcp:5039::5039 \
#                -nographic
qemu-system-arm -M vexpress-a9 \
                -cpu cortex-a9 \
                -m 128M \
                -kernel zImage-5.6.0-vexpress \
                -dtb vexpress-v2p-ca9.dtb \
                -sd mini-rootfs.ext2 \
                -append "root=/dev/mmcblk0 ro console=tty1 console=ttyAMA0" \
                -net nic -net user \
                -nographic

