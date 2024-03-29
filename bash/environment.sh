################################# ---- VARIABLES ---- #################################

MASTER_HOST="192.168.0.2"
MASTER_PORT="22"
MASTER_USER="user"
MASTER_K3S_HOST="master.com"

WORKER_HOST="192.168.0.3"
WORKER_PORT="22"
WORKER_USER="user2"

EXECUTE_WITH_SSH=true

################################# ---- FUNCIONES ---- #################################

cmd_exec(){
    command="$1"
    TARGET_USER=${TARGET_USER}
    TARGET_HOST=${TARGET_HOST}
    TARGET_PORT=${TARGET_PORT}

    if [[ "$EXECUTE_WITH_SSH" == "true" ]]; then
        echo "RUNNING ON $TARGET_USER@$TARGET_HOST:$TARGET_PORT"
        echo "RUNNING COMMAND: \"$command\" ..."
        echo $(ssh $TARGET_USER@$TARGET_HOST -p $TARGET_PORT -S "$command")
    else
        echo "RUNNING COMMAND: $command ..."
        echo $(eval $command)
    fi
}



