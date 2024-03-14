#!/bin/sh

. ../bash/environment.sh

export MASTER_HOST="$MASTER_HOST"
export MASTER_PORT="$MASTER_PORT"
export MASTER_USER="$MASTER_USER"
export MASTER_K3S_HOST="$MASTER_K3S_HOST"
export WORKER_HOST="$WORKER_HOST"
export WORKER_PORT="$WORKER_PORT"
export WORKER_USER="$WORKER_USER"

cat <<EOF
{
  "master_host": "$MASTER_HOST",
  "master_port": "$MASTER_PORT",
  "master_user": "$MASTER_USER",
  "master_k3s_host": "$MASTER_K3S_HOST",
  "worker_host": "$WORKER_HOST",
  "worker_port": "$WORKER_PORT",
  "worker_user": "$WORKER_USER"
}
EOF
