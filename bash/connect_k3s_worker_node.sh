. ./environment.sh

################################# ---- VARIABLES ---- #################################

TARGET_HOST=${1:-$WORKER_HOST}
TARGET_PORT=${2:-$WORKER_PORT}
TARGET_USER=${3:-$WORKER_USER}

################################# ---- EJECUCION ---- #################################

echo "Extracting node token from master ..."

node_token=$(ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT "sudo cat /var/lib/rancher/k3s/server/node-token")

echo "NODE TOKEN: $node_token"

echo "Installing k3s slave on worker ..."

cmd_exec "curl -sL https://get.k3s.io -o k3s_installer.sh && chmod +x k3s_installer.sh"
cmd_exec "K3S_URL=https://$MASTER_K3S_HOST:6443 K3S_TOKEN=$node_token sh ./k3s_installer.sh"
cmd_exec "systemctl enable --now k3s-agent"

echo "Configuring worker ..."

cmd_exec "echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc"
cmd_exec "mkdir -p ~/.kube"

command="ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT \"cat ~/.kube/config\" > ~/.kube/config"

cmd_exec "$command"

cmd_exec "sed -i \"s|https://127.0.0.1:6443|https://$MASTER_K3S_HOST:6443|\" ~/.kube/config"

echo "Configuration finalized."

echo "Getting cluster nodes:"

cmd_exec "kubectl get nodes"