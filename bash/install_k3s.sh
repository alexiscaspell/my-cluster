#!/bin/bash

. ./environment.sh

################################# ---- VARIABLES ---- #################################
TARGET_HOST="$1"
TARGET_PORT="$2"
TARGET_USER="$3"

################################# ---- EJECUCION ---- #################################

cmd_exec "/usr/local/bin/k3s-killall.sh | /usr/local/bin/k3s-uninstall.sh || echo 'Nothing to uninstall'"

cmd_exec "curl -sfL https://get.k3s.io | sh -" 

cmd_exec "echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc"

cmd_exec "sudo cat /etc/rancher/k3s/k3s.yaml > ~/.kube/config"

chmod +x create_cluster_config.sh

sudo ./create_cluster_config.sh

sleep 10

cmd_exec "kubectl get nodes"