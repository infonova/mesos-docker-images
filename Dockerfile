FROM ubuntu:14.04
MAINTAINER Infonova <stefan.eder@infonova.com>

ENV UBUNTU_VERSION trusty

ENV MESOS_VERSION_SHORT 1.2.1
ENV MESOS_VERSION_FULL $MESOS_VERSION_SHORT-2.0.1

ENV DOCKER_VERSION_SHORT 1.12.6
ENV DOCKER_VERSION_FULL $DOCKER_VERSION_SHORT-0~ubuntu-trusty

RUN apt-get update && \
  apt-get -y install apt-transport-https ca-certificates && \
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
  echo "deb https://apt.dockerproject.org/repo ubuntu-$UBUNTU_VERSION main" > /etc/apt/sources.list.d/docker.list && \
  apt-get update && \
  apt-get -y install docker-engine=$DOCKER_VERSION_FULL && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://repos.mesosphere.io/ubuntu/ $UBUNTU_VERSION main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get -y update && \
  apt-get -y install mesos=$MESOS_VERSION_FULL && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
