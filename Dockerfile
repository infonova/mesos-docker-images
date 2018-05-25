FROM infonova/mesos-docker-base:18.03.1-ce
MAINTAINER Bearingpoint

ARG UBUNTU_CODENAME=xenial
ARG MESOS_VERSION_SHORT=1.6.0
ARG MESOS_VERSION_FULL=$MESOS_VERSION_SHORT-2.0.4

RUN echo "deb http://repos.mesosphere.io/ubuntu/ $UBUNTU_CODENAME main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get update && \
  apt-get -y install mesos=$MESOS_VERSION_FULL --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*
