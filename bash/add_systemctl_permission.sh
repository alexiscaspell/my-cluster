#!/bin/bash

. ./environment.sh

USER_TO_GIVE_ACCESS="${1:-$WORKER_USER}"

content="$USER_TO_GIVE_ACCESS ALL=(ALL) NOPASSWD: /bin/systemctl"

sudoers_dir="/etc/sudoers.d"
if [ ! -d "$sudoers_dir" ]; then
    sudo mkdir -p "$sudoers_dir"
fi

echo "$content" | sudo tee "$sudoers_dir/systemctl_permission" > /dev/null

sudo chmod 440 "$sudoers_dir/systemctl_permission"

if sudo visudo -c -f "$sudoers_dir/systemctl_permission"; then
    echo "sudoers file syntax is valid."
    echo "Changes applied successfully."
else
    echo "There was an error in the sudoers file syntax. Changes were not applied."
fi

