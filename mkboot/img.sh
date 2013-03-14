echo "making ramdisk"
cd boot.img-ramdisk
chmod 750 init* charger
chmod 644 default.prop
chmod 640 fstab.n1
chmod 644 ueventd*
find . | cpio -o -H newc | gzip > ../newramdisk.cpio.gz
cd ..
./mkbootimg --cmdline 'no_console_suspend=1' --kernel zImage --ramdisk newramdisk.cpio.gz -o boot.img 
