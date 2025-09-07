#!/usr/bin/env bash
set -e
k3d node create eks-sim-agent-extra --cluster eks-sim --kubeconfig-switch-context
echo "Created an extra k3d agent node."
