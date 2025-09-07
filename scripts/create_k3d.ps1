param(
  [string]$ClusterName = "eks-sim",
  [int]$Servers = 1,
  [int]$Agents  = 1
)

Write-Host "Creating k3d cluster $ClusterName with $Servers server(s) and $Agents agent(s)..."
k3d cluster create $ClusterName --servers $Servers --agents $Agents --wait

Write-Host "Exporting kubeconfig to default location (~/.kube/config)..."
k3d kubeconfig merge $ClusterName --kubeconfig-switch-context

Write-Host "Cluster created. Run 'kubectl get nodes' to verify."
