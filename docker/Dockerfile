FROM ubuntu:14.04
MAINTAINER Bearingpoint

ENV DOCKER_VERSION_SHORT 1.12.6
ENV DOCKER_VERSION_FULL $DOCKER_VERSION_SHORT-0~ubuntu-trusty
ENV UBUNTU_VERSION trusty

RUN apt-get update && \
  apt-get -y install apt-transport-https ca-certificates && \
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
  echo "deb https://apt.dockerproject.org/repo ubuntu-$UBUNTU_VERSION main" > /etc/apt/sources.list.d/docker.list && \
  apt-get update && \
  apt-get -y install docker-engine=$DOCKER_VERSION_FULL && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
