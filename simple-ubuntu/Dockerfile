FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y fortune figlet

COPY start.sh /app/start.sh
CMD [ "/app/start.sh" ]
