### Start web server container
```
# start a web server from httpd:2.4 image
bob@ip-10-29-16-253:~/docker-demo/web-server$ docker run -d --name web \
       -p 8090:80 \
       -v $(readlink -f htdocs)/:/usr/local/apache2/htdocs/ \
       httpd:2.4

# check web server
bob@ip-10-29-16-253:~/docker-demo/web-server$ curl http://localhost:8090
```

