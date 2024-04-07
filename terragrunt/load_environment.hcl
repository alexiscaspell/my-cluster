locals {
  master_host = jsondecode(run_cmd("./environment.sh")).master_host
  master_port = jsondecode(run_cmd("./environment.sh")).master_port
  master_user = jsondecode(run_cmd("./environment.sh")).master_user
  master_k3s_host = jsondecode(run_cmd("./environment.sh")).master_k3s_host
  master_ssh_pass = jsondecode(run_cmd("./environment.sh")).master_ssh_pass
  worker_host = jsondecode(run_cmd("./environment.sh")).worker_host
  worker_port = jsondecode(run_cmd("./environment.sh")).worker_port
  worker_user = jsondecode(run_cmd("./environment.sh")).worker_user
  worker_ssh_pass = jsondecode(run_cmd("./environment.sh")).worker_ssh_pass
}

