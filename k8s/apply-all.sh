#!/bin/bash

# For Unix-like operating systems (Linux Distros, Mac OS ...)
# /> chmod +x apply-all.sh
# Apply all files (including subdirectories)
kubectl apply -f ./metrics/metrics.yaml
kubectl apply -f ./techlanches-namespace.yaml
kubectl apply -f ./techlanches-secrets.yaml
kubectl apply -f ./techlanches-configmap.yaml
kubectl apply -f ./k8s/deployments/techlanches-api-pagamento-deployment.yaml
kubectl apply -f ./k8s/deployments/techlanches-api-pedido-deployment.yaml
kubectl apply -f ./k8s/deployments/techlanches-api-producao-deployment.yaml
kubectl apply -f ./deployments/techlanches-rabbitmq-deployment.yaml
