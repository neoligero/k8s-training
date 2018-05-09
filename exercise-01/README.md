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
 - bitnami/wordpress:latest

### Deployment

Creates the namespace "exercise-01" and set it as default, every configuration file has the namespace itself, but is a good practice anyway.
Environment variables are defined into the configmap and secret files.
Next step is install the 3 deployments and services to expose the pods.
Finally the ingress routes the request to the correct app.

### Difficulties found

 - Communicate one pod with each other, labels and selectors worked here.
 - Generates automatically user and password in the database.