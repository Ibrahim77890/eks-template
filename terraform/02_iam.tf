resource "local_file" "iam_sim" {
  filename = "${path.module}/.local/iam_sim.json"
  content  = jsonencode({
    iam_roles = [
      { name = "eks-cluster-role", arn = "arn:aws:iam::000000000000:role/eks-cluster-role-sim" },
      { name = "node-role", arn = "arn:aws:iam::000000000000:role/node-role-sim" }
    ]
    note = "Simulated IAM roles for demo only"
  })
}

output "iam_sim_file" {
  value = local_file.iam_sim.filename
}
