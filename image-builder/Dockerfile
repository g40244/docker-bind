FROM centos

MAINTAINER g40244 <gustav.uhia@gmail.com>

# install bind
RUN yum -y update && yum -y install bind && yum clean all

# copy template file
COPY ./files/zones_template /etc/named.template.zones
COPY ./files/zonefile_template /var/named/template.zone
COPY ./files/bind.sh /root/bind.sh

# config bind
RUN sed -i --follow-symlinks '/listen-on/s/127.0.0.1/any/g' /etc/named.conf && \
    sed -i --follow-symlinks '/allow-query/s/localhost/any/g' /etc/named.conf && \
    chown -R named:named /var/named

# run bind
EXPOSE 53/udp
EXPOSE 53/tcp
ENTRYPOINT ["bash", "/root/bind.sh"]
CMD ["example.com", "192.168.0.0"]
