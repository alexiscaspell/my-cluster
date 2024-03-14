DISK_TO_MOUNT="${1:-/dev/sda2}"
DIR_TO_MOUNT="${2:-/media/tostado/HIKVISION}"

sudo fsck $DISK_TO_MOUNT

mount_format="$(sudo fdisk -l | grep $DISK_TO_MOUNT | awk '{for(i=6;i<=NF;++i)print $i}')"
mount_format="$(echo $mount_format|sed 's@Microsoft basic data@exfat@')"

mkdir -p $DIR_TO_MOUNT

sudo mount -t $mount_format $DISK_TO_MOUNT $DIR_TO_MOUNT
