locals {
    env_vars = read_terragrunt_config("../load_environment.hcl")
}

terraform {
    source = "git@github.com:alexiscaspell/terraform-modules.git//argocd?ref=main"
}

inputs = {
  argocd_version = "5.10.5"
  namespace    = "argocd"
  kubeconfig_path = "/home/tostado/.kube/cluster_k3s_tostado"
  kube_context = "cluster_k3s_tostado" 
}