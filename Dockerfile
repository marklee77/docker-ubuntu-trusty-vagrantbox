FROM phusion/baseimage:latest
MAINTAINER Mark Stillwell <mark@stillwell.me>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install python && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN echo 'root:vagrant' | chpasswd

RUN useradd -m -s /bin/bash vagrant
RUN echo 'vagrant:vagrant' | chpasswd

ADD https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub\
    /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant && \
    chmod 0700 /home/vagrant/.ssh && \
    chmod 0600 /home/vagrant/.ssh/authorized_keys

RUN echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant
