#!/bin/bash

# vexpress booted with sd, kernel 3.x
# -redir tcp:5039::5039  --> TCP port 5039 on the host is redirected to the guest's port 5039
qemu-system-arm -M vexpress-a9 \
                -cpu cortex-a9 \
                -m 128M \
                -kernel zImage-3.0.35-vexpress \
                -sd mini-rootfs.ext2 \
                -append "root=/dev/mmcblk0 ro console=tty1 console=ttyAMA0" \
                -net nic -net user \
                -redir tcp:5039::5039 \
                -nographic
