. ./environment.sh

################################# ---- VARIABLES ---- #################################
TARGET_HOST="$1"
TARGET_PORT="$2"
TARGET_USER="$3"

################################# ---- EJECUCION ---- #################################

cmd_exec "curl -sfL https://get.k3s.io | sh -" 

cmd_exec "echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc"

cmd_exec "sudo cat /etc/rancher/k3s/k3s.yaml > ~/.kube/config"

. ./create_cluster_config.sh

cmd_exec "kubectl get nodes"