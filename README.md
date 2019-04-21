# PHP-FPM alpine

The image with intalled xdebug, composer and configured non root user `dev`.

To connect to the container
as non root:
```
$ docker exec -it container-name su dev
```
as root:
```
$ docker exec -it container-name su
```

Use `$ docker ps` command to get the container name.
