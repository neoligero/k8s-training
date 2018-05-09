#!/bin/bash
kubectl create ns exercise-03

# Clean installation
# kubectl delete configmap --all
# kubectl delete secret --all
# kubectl delete deployment --all
# kubectl delete svc --all
# kubectl delete ingress --all

# Set default namespace
# This is not necesary because the namespace is define in each definition,
# anyway is a good practice
kubectl config set-context $(kubectl config current-context) --namespace=exercise-03

# Creating config and secrets
kubectl create -f configmap.yaml
kubectl create -f secret.yaml

kubectl create -f nginx-deployment.yaml
kubectl create -f nginx-svc.yaml

# Create external service for the database
kubectl create -f externaldb-svc.yaml

kubectl create -f wordpress-deployment.yaml
kubectl create -f wordpress-svc.yaml

# Creating ingress and access through dns
echo "${MY_SANDBOX_IP}   wordpress-exercise-03.com" | sudo tee -a /etc/hosts
kubectl create -f ingress.yaml 