#!/bin/bash

. ./environment.sh

content="write-kubeconfig-mode: \"0644\"
tls-san:
  - \"$MASTER_K3S_HOST\"
cluster-init: true"

file_name="/etc/rancher/k3s/config.yaml"

echo "$content" > "$file_name"

echo "Content has been written to $file_name"
