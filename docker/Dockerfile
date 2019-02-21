FROM ubuntu:16.04
LABEL maintainer="BearingPoint Tech"

ARG UBUNTU_CODENAME=xenial
ARG DOCKER_VERSION_SHORT=18.06.1
ARG DOCKER_VERSION_FULL=$DOCKER_VERSION_SHORT~ce~3-0~ubuntu

RUN apt-get update  && \
    \
    apt-get -y install \
      apt-transport-https \
      ca-certificates \
      curl && \
    \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update  && \
    apt-get -y install docker-ce=$DOCKER_VERSION_FULL --no-install-recommends && \
    \
    rm -rf /var/lib/apt/lists/*
