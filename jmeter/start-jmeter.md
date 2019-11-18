## Starting JMeter deployment

### building the docker images
1. Build a base docker image (common for all jmeter nodes)
```
$ docker build -t vinsdocker/jmbase .
```

2. Build Jmeter master
```
$ cd jmeter-master
$ docker build -t vinsdocker/jmeter-master .
```

3. Build Jmeter slave
```
$ cd jmeter-slave
$ docker build -t vinsdocker/jmeter-slave .
```
### Starting the containers

4. Launch 3 slaves and 1 master node:
```
$ docker run -dit --name jmeter-slave01 vinsdocker/jmeter-slave  /bin/bash
$ docker run -dit --name jmeter-slave02 vinsdocker/jmeter-slave  /bin/bash
$ docker run -dit --name jmeter-slave03 vinsdocker/jmeter-slave  /bin/bash
$ docker run -dit --name jmeter-masteri vinsdocker/jmeter-master /bin/bash
```

5. Login to master and start local testing and distributed testing:
```
$ docker exec -ti jmeter-master /bin/bash
root@f70c460e2bd9:/# jmeter -n -t sample-test/sample-test.jmx
root@f70c460e2bd9:/# jmeter -n -t sample-test/sample-test.jmx -R172.17.0.2,172.17.0.3,172.17.0.4

```




