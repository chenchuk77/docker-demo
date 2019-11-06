### login
From any ssh terminal login to the host
```
$ ssh bob@54.194.95.172                     # login as different user
bob@54.194.95.172's password:               # 1234
bob@ip-10-29-16-253:~$

```

### Docker commands
Show running containers
```
bob@ip-10-29-16-253:~$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

Run simple container
```
bob@ip-10-29-16-253:~$ docker run hello-world
Hello from Docker!
```

Show all containers
```
bob@ip-10-29-16-253:~$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                          PORTS               NAMES
3b4141c3a4ec        hello-world         "/hello"            About a minute ago   Exited (0) About a minute ago                       cool_shamir
```

Get container logs (even if stopped)
```
bob@ip-10-29-16-253:~$ docker logs cool_shamir   # by container name
bob@ip-10-29-16-253:~$ docker logs 3b4           # by container id
```

Stop and Remove containers
```
bob@ip-10-29-16-253:~/docker-demo/web-server$ docker stop my-busybox-container
bob@ip-10-29-16-253:~/docker-demo/web-server$ docker rm 235e
```

### More commands
Stop anf kill all containers
```
$ docker ps -aq
770bcfc780ec
3b4141c3a4ec
bob@ip-10-29-16-253:~/docker-demo/web-server$ docker ps -aq | xargs docker stop | xargs docker rm
770bcfc780ec
3b4141c3a4ec

```

