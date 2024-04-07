#!/bin/sh

. ../bash/environment.sh

export MASTER_HOST="$MASTER_HOST"
export MASTER_PORT="$MASTER_PORT"
export MASTER_USER="$MASTER_USER"
export MASTER_K3S_HOST="$MASTER_K3S_HOST"
export MASTER_SSH_PASS="$MASTER_SSH_PASS"
export WORKER_HOST="$WORKER_HOST"
export WORKER_PORT="$WORKER_PORT"
export WORKER_USER="$WORKER_USER"
export WORKER_SSH_PASS="$WORKER_SSH_PASS"

cat <<EOF
{
  "master_host": "$MASTER_HOST",
  "master_port": "$MASTER_PORT",
  "master_user": "$MASTER_USER",
  "master_k3s_host": "$MASTER_K3S_HOST",
  "master_ssh_pass":"$MASTER_SSH_PASS",
  "worker_host": "$WORKER_HOST",
  "worker_port": "$WORKER_PORT",
  "worker_user": "$WORKER_USER",
  "worker_ssh_pass":"$WORKER_SSH_PASS"
}
EOF
