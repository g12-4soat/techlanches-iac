#!/bin/bash

# For Unix-like operating systems (Linux Distros, Mac OS ...)
# /> chmod +x apply-all.sh
# Apply all files (including subdirectories)
kubectl apply -f ./k8s/metrics/metrics.yaml
kubectl apply -f ./k8s/techlanches-namespace.yaml
kubectl apply -f ./k8s/techlanches-secrets.yaml
kubectl apply -f ./k8s//hpas/techlanches-api-hpa.yaml
kubectl apply -f ./k8s/hpas/techlanches-worker-hpa.yaml
kubectl apply -f ./k8s/deployments/techlanches-api-deployment.yaml
kubectl apply -f ./k8s/deployments/techlanches-worker-deployment.yaml
kubectl apply -f ./k8s/deployments/techlanches-rabbitmq-deployment.yaml
