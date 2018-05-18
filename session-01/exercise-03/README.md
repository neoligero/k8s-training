# Exercise-03

## Wordpress deployment with MariaDB

Deploys k8s resources needed to expose a functional wordpress external site.

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

Creates the namespace "exercise-03" and set it as default, every configuration file has the namespace itself, but is a good practice anyway.
Environment variables are defined into the configmap and secret files.
Next step is install the 2 deployments and services to expose the pods.
Create service for the external connection.
Finally the ingress routes the request to the correct app.

### Difficulties found

 - Find how to create a rds service for external access.
 - No time to finish everything, I missed /admin redirection and TSL, I'm working full time and attending another events and courses, so sorry.