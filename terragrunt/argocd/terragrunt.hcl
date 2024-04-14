include {
  path = find_in_parent_folders("terragrunt_local.hcl")
}

locals {
    env_vars = read_terragrunt_config("../load_environment.hcl")
}

terraform {
    source = "git@github.com:alexiscaspell/terraform-modules.git//argocd?ref=main"
}

inputs = {
  argocd_version = "6.0.9"
  namespace    = "argocd"
  kubeconfig_path = "/home/tostado/.kube/cluster_k3s_tostado"
  kube_context = "cluster_k3s_tostado"
  sets = {
    "config.secret.argocdServerAdminPassword" = "mypassword"
  }

  repositories = [
    {
      "name": "gitops",
      "url": "https://github.com/alexiscaspell/cluster-gitops",
      "password": "mypassword"
    }
  ]

  applications = [
    {
      "name": "root",
      "repo_url": "https://github.com/alexiscaspell/cluster-gitops",
      "path": "root-app/",
      "project": "default",
      "namespace": "default"
    }
  ]
}