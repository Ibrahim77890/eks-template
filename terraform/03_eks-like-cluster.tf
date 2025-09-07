resource "null_resource" "k3d_cluster_hint" {
  provisioner "local-exec" {
    command = "echo 'Run ./scripts/create_k3d.ps1 (PowerShell) or ./scripts/create_k3d.sh (WSL) to create the k3d cluster.'"
  }
}

output "kubeconfig_path" {
  value = var.kubeconfig
}
