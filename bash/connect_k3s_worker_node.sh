#!/bin/bash

. ./environment.sh

################################# ---- VARIABLES ---- #################################

TARGET_HOST=${1:-$WORKER_HOST}
TARGET_PORT=${2:-$WORKER_PORT}
TARGET_USER=${3:-$WORKER_USER}

################################# ---- EJECUCION ---- #################################

echo "Extracting node token from master ..."

node_token=$(sshpass -p "$MASTER_SSH_PASS" ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT "sudo cat /var/lib/rancher/k3s/server/node-token")

echo "NODE TOKEN: $node_token"

echo "Installing k3s slave on worker ..."

cmd_exec "/usr/local/bin/k3s-killall.sh | /usr/local/bin/k3s-agent-uninstall.sh || echo 'Nothing to uninstall'"

cmd_exec  "curl -sL https://get.k3s.io | K3S_URL=https://$MASTER_K3S_HOST:6443 K3S_TOKEN=$node_token INSTALL_K3S_EXEC=agent sh  -"
cmd_exec "sudo systemctl enable --now k3s-agent"

echo "Configuring worker ..."

line_to_delete='export KUBECONFIG=~/.kube/config'

cmd_exec "sed -i \"/$line_to_delete/d\" ~/.bashrc"

cmd_exec "echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc"
cmd_exec "mkdir -p ~/.kube"

command="sshpass -p \"$MASTER_SSH_PASS\" ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT \"cat ~/.kube/config\" > ~/.kube/config"

cmd_exec "$command"

cmd_exec "sed -i \"s|https://127.0.0.1:6443|https://$MASTER_K3S_HOST:6443|\" ~/.kube/config"

echo "Configuration finalized."

echo "Getting cluster nodes:"

cmd_exec "kubectl get nodes"