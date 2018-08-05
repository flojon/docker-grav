# Grav Docker Image
Docker image for [Grav](https://getgrav.org/) a modern open source flat-file CMS.
Includes the [Administration panel](https://learn.getgrav.org/admin-panel/introduction) plugin.

This image is published to docker hub as [flojon/grav](https://hub.docker.com/r/flojon/grav/)

Inspired by [pgrm/docker-grav](https://github.com/pgrm/docker-grav) and [docker-library/wordpress](https://github.com/docker-library/wordpress).


## Basic usage
Run
```
docker run -v grav:/var/www/html -p 8080:80 grav:1.4.8
```
and then visit http://localhost:8080/

This will create a named volume `grav` and map it to `/var/www/html`. It will also map local port `8080` to container port `80`.
