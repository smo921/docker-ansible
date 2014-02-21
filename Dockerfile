FROM ubuntu:saucy
MAINTAINER Steve Oberther stephenoberther@gmail.com

RUN apt-get -y update
RUN apt-get install -y python-yaml python-jinja2 python-apt python-pycurl git
RUN git clone http://github.com/ansible/ansible.git /tmp/ansible
WORKDIR /tmp/ansible
ENV PATH /tmp/ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /tmp/ansible/library
ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH

###RUN git clone http://github.com/yourusername/yourrepo.git /tmp/example
ADD ansible-module /tmp/example 

ADD inventory /etc/ansible/hosts
WORKDIR /tmp/example

RUN ansible-playbook site.yml -c local


EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
