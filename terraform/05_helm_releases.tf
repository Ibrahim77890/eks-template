resource "helm_release" "metrics_server" {
  name             = "metrics-server"
  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  chart            = "metrics-server"
  namespace        = "kube-system"
  create_namespace = true
  timeout          = 300
  force_update     = true
  cleanup_on_fail  = true
  atomic          = true
  replace         = true
  version         = "3.13.0"
}


resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.3.0"
  namespace  = "ingress-nginx"

  values = [
    file("${path.module}/helm-values/nginx-values.yaml")
  ]

  create_namespace = true
  wait = false
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.12.0"
  namespace  = "cert-manager"

  values = [
        <<-YAML
    installCRDs: true
    # other chart values...
        YAML
  ]

  create_namespace = true
  depends_on = [helm_release.metrics_server]
}

resource "helm_release" "metallb" {
  name       = "metallb"
  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  version    = "0.13.10"
  namespace  = "metallb-system"
  create_namespace = true
}
