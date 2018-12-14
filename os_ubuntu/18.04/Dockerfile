########## Pull base image
FROM ubuntu:18.04

########## Update base packages
RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install apt-utils -y && \
  apt-get upgrade -y && \
  apt-get dist-upgrade -y && \
  apt-get autoremove --purge && \
  rm -rf /tmp/*

########## Add startup manager
COPY startup_manager/ /opt/startup_manager/
COPY startup_manager_configs/__etc__startup_manager.conf /etc/startup_manager.conf

CMD /opt/startup_manager/init.sh