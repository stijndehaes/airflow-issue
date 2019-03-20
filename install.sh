#!/usr/bin/env bash

set -e

eval $(minikube docker-env)
docker build -t airflow:1.10.2 .
helm init

kubectl apply -f namespace-airflow.yaml
helm upgrade --install airflow stable/airflow -f values.yaml --namespace airflow


kubectl apply -f namespace-airflow-secret.yaml
kubectl apply -f secret.yaml -n airflow-secret
helm upgrade --install airflow-secret stable/airflow -f values-with-secret.yaml --namespace airflow-secret
