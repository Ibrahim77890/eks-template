resource "local_file" "vpc_sim" {
  filename = "${path.module}/.local/vpc_sim.json"
  content  = jsonencode({
    name      = "local-vpc"
    cidr      = "10.0.0.0/16"
    subnets   = [
      { name = "public-1", cidr = "10.0.1.0/24", type = "public" },
      { name = "private-1", cidr = "10.0.2.0/24", type = "private" }
    ]
    created_by = "terraform (local simulation)"
  })
}

output "vpc_sim_file" {
  value = local_file.vpc_sim.filename
}
