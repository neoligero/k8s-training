#!/bin/bash
kubectl create ns exercise-02

# Clean installation
# kubectl delete ns exercise-02

# Set default namespace
# This is not necesary because the namespace is define in each definition,
# anyway is a good practice
kubectl config set-context $(kubectl config current-context) --namespace=exercise-02

# Creating config and secrets
kubectl create -f configmap.yaml
kubectl create -f secret.yaml

kubectl create -f mariadb-deployment.yaml
# Test that MariaDB works
# kubectl exec -it ${MY_SANDBOX_IP} -- mysql -h 127.0.0.1 -u root -pBitnami

kubectl create -f mariadb-svc.yaml
# Checking the service
# mysql --host ${MY_SANDBOX_IP} --port ${MARIADB_SVC_PORT} -u root -pBitnami

kubectl create -f wordpress-deployment.yaml
kubectl create -f wordpress-deployment-canary.yaml
kubectl create -f wordpress-svc.yaml

# Creating ingress and access through dns
# echo "${MY_SANDBOX_IP}   wordpress-exercise-02.com" | sudo tee -a /etc/hosts
kubectl create -f ingress.yaml 