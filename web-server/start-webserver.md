### Start web server container
This command will start a new container
* container will run as daemon
* named container - it means that 2nd invocation will fail!
* port 80 on the container mapped to 8090 on the docker host
* base image: httpd:2.4
* content of ./htdocs mapped to /usr/local/apache2/htdocs/ inside the container


```
# start a web server
# NOTE: readlink -f returns the absolute path
bob@ip-10-29-16-253:~/docker-demo/web-server$ docker run -d --name web \
       -p 8090:80 \
       -v $(readlink -f htdocs)/:/usr/local/apache2/htdocs/ \
       httpd:2.4

# check web server
bob@ip-10-29-16-253:~/docker-demo/web-server$ curl http://localhost:8090
```

