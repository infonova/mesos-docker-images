FROM infonova/mesos-docker-base:18.06.1-ce
LABEL maintainer="BearingPoint Tech"

ARG UBUNTU_CODENAME=xenial
ARG MESOS_VERSION_SHORT=1.7.2
ARG MESOS_VERSION_FULL=$MESOS_VERSION_SHORT-2.0.1

RUN echo "deb http://repos.mesosphere.io/ubuntu/ $UBUNTU_CODENAME main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get update && \
  apt-get -y install mesos=$MESOS_VERSION_FULL --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*
