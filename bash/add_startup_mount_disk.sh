#!/bin/bash

. ./environment.sh

DISK_TO_MOUNT="${1:-/dev/sda2}"
DIR_TO_MOUNT="${2:-/media/tostado/HIKVISION}"

sudo cp mount_disk.sh /etc/init.d/mount_disk

sudo chmod +x /etc/init.d/mount_disk

cron_command="@reboot bash /etc/init.d/mount_disk $DISK_TO_MOUNT $DIR_TO_MOUNT"

echo "$cron_command" | crontab -

# sudo mkdir -p /etc/rc.d/

# sudo ln -s /etc/init.d/mount_disk /etc/rc.d/