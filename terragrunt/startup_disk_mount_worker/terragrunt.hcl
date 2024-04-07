include {
  path = find_in_parent_folders("terragrunt_local.hcl")
}

locals {
    env_vars = read_terragrunt_config("../load_environment.hcl")
    script_path  = "/home/tostado/Documentos/Repositorios/my-cluster/bash/add_startup_mount_disk.sh"
    local_dir  = "/home/tostado/Documentos/Repositorios/my-cluster/bash"
}


terraform {
    source = "git@github.com:alexiscaspell/terraform-modules.git//ssh-execute?ref=main"
}

inputs = {
    ssh_host     = local.env_vars.locals.worker_host
    ssh_port     = local.env_vars.locals.worker_port
    ssh_user     = local.env_vars.locals.worker_user
    ssh_password = local.env_vars.locals.worker_ssh_pass
    script_path  = local.script_path
    local_directory = local.local_dir
}