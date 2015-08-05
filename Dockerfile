FROM ubuntu:utopic
MAINTAINER Deven Phillips <dphillips@zanclus.com>

WORKDIR /tmp
RUN apt-get update && apt-get -y install wget && rm -rf /var/cache/apt/*
RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-utopic.deb
RUN dpkg -i puppetlabs-release-pc1-utopic.deb
RUN apt-get update && apt-get -y install supervisor vim puppetserver puppet-agent && rm -rf /var/cache/apt/*
ENV PUPPETSERVER_JAVA_ARGS="-Xms768m -Xmx768m"
EXPOSE 8140
