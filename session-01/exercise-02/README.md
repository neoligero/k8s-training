# Exercise-01

## Wordpress deployment with MariaDB

Deploys k8s resources needed to expose a functional wordpress site.

### Installation

Execute the file commands.bash
```
chmod +x commands.bash
./commads.bash
```
### Resource images

 - bitnami/nginx
 - bitnami/mariadb:latest
 - bitnami/wordpress:4.9.4
 - bitnami/wordpress:4.9.5

### Deployment

Creates the namespace "exercise-02" and set it as default, every configuration file has the namespace itself, but is a good practice anyway.
Environment variables are defined into the configmap and secret files.
Next step is install the 3 deployments and services to expose the pods.
Aditionally create the canary deployment for the new version of the app.
Finally the ingress routes the request to the correct app.

### Difficulties found

 - Put the readiness and lifeness in the correct place.
 - Find the correct querys for the readiness and liveness.