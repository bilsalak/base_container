########## Pull base image
FROM ubuntu:18.04

########## Update base packages
RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update -y && \
  apt-get dist-upgrade -y && \
  apt-get autoremove --purge && \
  apt-get clean && \
  rm -rf /tmp/* && \
  rm -rf /var/log && \
  mkdir -p /var/log/apt

########## Add startup manager
COPY startup_manager/ /opt/startup_manager/
COPY startup_manager_configs/__etc__startup_manager.conf /etc/startup_manager.conf

CMD /opt/startup_manager/init.sh