. ./environment.sh

################################# ---- VARIABLES ---- #################################

TARGET_USER=${1:-$WORKER_HOST}
TARGET_HOST=${2:-$WORKER_PORT}
TARGET_PORT=${3:-$WORKER_USER}

################################# ---- EJECUCION ---- #################################

node_token=$(cmd_exec "ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT \"sudo cat /var/lib/rancher/k3s/server/node-token\"")

cmd_exec "ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT \"curl -sfL https://get.k3s.io | K3S_URL=https://$MASTER_HOST:6443 K3S_TOKEN=\"$node_token\" sh -\""

cmd_exec "echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc"

command="ssh $MASTER_USER@$MASTER_HOST -p $MASTER_PORT \"cat ~/.kube/config\" > ~/.kube/config"

cmd_exec "$command"

cmd_exec "sed -i \"s|https://127.0.0.1:6443|https://$MASTER_K3S_HOST:6443|\" ~/.kube/config"

cmd_exec "kubectl get nodes"