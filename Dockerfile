FROM infonova/mesos-docker-base:17.09.0-ce
MAINTAINER Bearingpoint

ENV MESOS_VERSION_SHORT 1.4.1
ENV MESOS_VERSION_FULL $MESOS_VERSION_SHORT-2.0.1

RUN echo "deb http://repos.mesosphere.io/ubuntu/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get -y update && \
  apt-get -y install mesos=$MESOS_VERSION_FULL && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
