## Create `monitoring` namespace
```
kubectl create ns monitoring
```
## Install grafana
```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana -n monitoring grafana/grafana -f grafana.yaml
```
## Install Prometheus server
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus -n monitoring prometheus-community/prometheus -f prometheus.yaml
```

## Install Logging Loki-stack
```
helm repo add grafana https://grafana.github.io/helm-charts
helm install loki -n monitoring grafana/loki-stack -f loki.yaml
```