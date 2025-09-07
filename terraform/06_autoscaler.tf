resource "local_file" "k3d_scale_script" {
  filename = "${path.module}/.local/add_k3d_node.sh"
  content  = <<-EOT
    #!/usr/bin/env bash
    set -e
    k3d node create ${var.cluster_name}-agent-extra --cluster ${var.cluster_name} --kubeconfig-switch-context
    echo "Created an extra k3d agent node."
  EOT
  file_permission = "0755"
}

output "k3d_add_node_script" {
  value = local_file.k3d_scale_script.filename
}
