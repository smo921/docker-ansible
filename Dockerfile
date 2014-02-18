FROM ubuntu
MAINTAINER Steve Oberther stephenoberther@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu precise multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

