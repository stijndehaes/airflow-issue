# Airflow KubernetesExecutor

This repo can be used to demonstrate some issues with the airflow kubernetes executor.

First you need a to start minikube:

```
minikube start --cpus 4 --memory 10000 --vm-driver hyperkit
```

After that you can run:

```
sh ./install.sh
```

To install 2 airflow instances.

Connect to either of them by using portforwarding to the web server on port 8080:

For case 1:

```
kubectl port-forward $(kubectl get pods --namespace airflow -l "component=web" -o jsonpath="{.items[0].metadata.name}") 8080 -n airflow
```
For case 2:

```
kubectl port-forward $(kubectl get pods --namespace airflow-secret -l "component=web" -o jsonpath="{.items[0].metadata.name}") 8080 -n airflow-secret
```

## Case 1

Case 1 demonstrates airflow not passing the fernet key to the workers and the workers thus failing.

You need to execute the variables dag, the sleep task uses an airflow variable and failes.

## Case 2

Case 2 provides an example where the fernet key is loaded but still variables dag will fail on the sleep task.
