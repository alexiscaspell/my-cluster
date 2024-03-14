locals {
  master_host = jsondecode(run_cmd("./environment.sh")).master_host
  master_port = jsondecode(run_cmd("./environment.sh")).master_port
  master_user = jsondecode(run_cmd("./environment.sh")).master_user
}