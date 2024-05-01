#!/bin/bash

# For Unix-like operating systems (Linux Distros, Mac OS ...)
# /> chmod +x apply-all.sh
# Apply all files (including subdirectories)
kubectl apply -f ../k8s/metrics/metrics.yaml
kubectl apply -f ../k8s/techlanches-namespace.yaml
kubectl apply -f ../k8s/techlanches-secrets.yaml
kubectl apply -f ../k8s/deployments/techlanches-api-pagamento-deployment.yaml
kubectl apply -f ../k8s/deployments/techlanches-api-pedido-deployment.yaml
kubectl apply -f ../k8s/deployments/techlanches-worker-producao-deployment.yaml
kubectl apply -f ../k8s/deployments/techlanches-rabbitmq-deployment.yaml
