FROM centos:7

# RUN yum install -y xinetd && yum install -y telnet-server

RUN yum install -y xinetd epel-release telnet sysstat net-tools tcpdump telnet-server && yum install -y stress
# RUN yum install -y stress

COPY telnet /etc/xinetd.d/telnet
COPY exp_mon /etc/xinetd.d/exp_mon
COPY docker-entrypoint.sh /
RUN mkdir -p /opt/metrics.d/ && chmod 777 docker-entrypoint.sh
COPY exporter_monitoring /opt/metrics.d/exporter_monitoring
COPY httpwrapper /opt/metrics.d/httpwrapper
RUN chmod +x /opt/metrics.d/*

EXPOSE 10100

# ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/docker-entrypoint.sh"]
