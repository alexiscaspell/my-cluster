#!/bin/bash

. ./environment.sh

content="write-kubeconfig-mode: \"0644\"
tls-san:
  - \"$MASTER_K3S_HOST\"
cluster-init: true"

file_name="/etc/rancher/k3s/config.yaml"

sudo mkdir -p /etc/rancher/k3s

sudo echo "$content" > "$file_name"

echo "Content has been written to $file_name"

sudo systemctl restart k3s
