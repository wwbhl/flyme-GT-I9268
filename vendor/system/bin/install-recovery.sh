#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7847936 485c1eb7c79f1e0e1c4df81f3bb12d83c5c09b43 5265408 7ce25ee8564e9a1d738e51ad4a15cfdf475886ed
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p6:7847936:485c1eb7c79f1e0e1c4df81f3bb12d83c5c09b43; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p5:5265408:7ce25ee8564e9a1d738e51ad4a15cfdf475886ed EMMC:/dev/block/mmcblk0p6 485c1eb7c79f1e0e1c4df81f3bb12d83c5c09b43 7847936 7ce25ee8564e9a1d738e51ad4a15cfdf475886ed:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
