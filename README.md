# Dockerized vue-cli
### Run docker container
**`docker run` command should be executed from the project folder!**
If your vue project placed in `/home/username/sites/vue` , so docker should be ran from this path as well.
```
$ cd /home/username/sites/vue
$ docker run --rm -it -p 8080:8080 -v $PWD:/app --name vue-cli mp091689/vue-cli
```
### To connect to the container
as non root user: 
```
$ docker exec -it vue-cli su node
```
as root: 
```
$ docker exec -it vue-cli su
```