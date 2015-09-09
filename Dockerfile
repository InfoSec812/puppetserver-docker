FROM ubuntu:utopic
MAINTAINER Deven Phillips <dphillips@zanclus.com>

WORKDIR /tmp
RUN apt-get update && apt-get -y install wget && rm -rf /var/cache/apt/*
RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-utopic.deb
RUN dpkg -i puppetlabs-release-pc1-utopic.deb
RUN apt-get update && apt-get -y install supervisor vim puppetserver puppet-agent && rm -rf /var/cache/apt/*
ADD start.sh /usr/bin/start.sh
RUN chmod 755 /usr/bin/start.sh
ADD puppetserver.conf /etc/supervisor/conf.d/puppetserver.conf
ENV PUPPETSERVER_JAVA_ARGS="-Xms768m -Xmx768m"
VOLUME /data
EXPOSE 8140
CMD /usr/bin/start.sh
RUN ln -s /etc/puppetlabs/puppetserver /etc/puppetserver
