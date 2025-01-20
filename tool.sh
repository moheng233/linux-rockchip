OUTPUT=/tmp/linux-rockchip
OUTPUT_BOOT=${OUTPUT}/arch/arm64/boot

qemu-system-aarch64 -M virt -cpu cortex-a55 -m 512M -smp 2 \
    -kernel ${OUTPUT_BOOT}/Image \
    -drive if=none,format=raw,file=${OUTPUT}/rootfs.raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -nographic -append "nokaslr console=ttyAMA0 loglevel=8 root=/dev/vda" \
    -s -S
    # -dtb ${OUTPUT_BOOT}/dts/rockchip/tspi-rk3566-user-v10-linux.dtb

// make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=/tmp/linux-rockchip/ Image -j 24
