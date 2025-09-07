variable "cluster_name" {
  type    = string
  default = "eks-sim"
}

variable "k3d_server_count" {
  type    = number
  default = 1
}

variable "k3d_agent_count" {
  type    = number
  default = 1
}

variable "metallb_ip_pool" {
  type    = string
  default = "172.18.255.200-172.18.255.240"
}
