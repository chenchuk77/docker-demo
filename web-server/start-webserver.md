### Start web server container
```
docker run -d --name web \
       -p 8090:80 \
       -v $(readlink -f htdocs)/:/usr/local/apache2/htdocs/ \
       httpd:2.4
```
