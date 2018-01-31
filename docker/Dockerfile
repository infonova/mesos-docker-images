FROM ubuntu:16.04
MAINTAINER Bearingpoint

ENV DOCKER_VERSION_SHORT 17.09.0
ENV DOCKER_VERSION_FULL $DOCKER_VERSION_SHORT~ce-0~ubuntu

RUN apt-get update  && \
    \
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common  && \
    \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -  && \
    \
    add-apt-repository -y \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"  && \
    \
    apt-get update  && \
    \
    apt-get -y install docker-ce=$DOCKER_VERSION_FULL  && \
    \
    apt-get clean && rm -rf /var/lib/apt/lists/*
