#!/usr/bin/env bash

set -e

eval $(minikube docker-env)
docker build -t airflow:1.10.2 .
helm init

kubectl apply -f secret.yaml
kubectl apply -f configmap.yaml
helm upgrade --install airflow ../charts/stable/airflow -f values.yaml --version 2.4.3
