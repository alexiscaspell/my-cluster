#!/bin/bash

# Content to write to pepe.yml
content='write-kubeconfig-mode: "0644"
tls-san:
  - "tostado.theworkpc.com"
cluster-init: true'

# Specify the file name
file_name="/etc/rancher/k3s/config.yaml"

# Write content to the file
echo "$content" > "$file_name"

# Display a message
echo "Content has been written to $file_name"
