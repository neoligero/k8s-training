#!/bin/bash
kubectl create ns exercise-03

# Clean installation
# kubectl delete ns exercise-03

# Set default namespace
# This is not necesary because the namespace is define in each definition,
# anyway is a good practice
kubectl config set-context $(kubectl config current-context) --namespace=exercise-03

# Creating config and secrets
kubectl create -f configmap.yaml
kubectl create -f secret.yaml

# Create external service for the database
kubectl create -f externaldb-svc.yaml

kubectl create -f wordpress-deployment.yaml
kubectl create -f wordpress-svc.yaml

kubectl get secrets --namespace=exercise03 |grep tls-wp &> /dev/null
if [ $? -ne 0 ];then
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=wordpress-exercise-03.com"
  kubectl create secret tls tls-wp --key /tmp/tls.key --cert /tmp/tls.crt --namespace=exercise-03
fi

# Creating ingress and access through dns
# echo "${MY_SANDBOX_IP}   wordpress-exercise-03.com" | sudo tee -a /etc/hosts
kubectl create -f ingress.yaml