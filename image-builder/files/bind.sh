#!/bin/bash

domain=$1
arpa=$2

mv /etc/named.template.zones /etc/named.$domain.zones
cp /var/named/template.zone /var/named/$domain.zone
mv /var/named/template.zone /var/named/$arpa.zone

echo "include \"/etc/named.$domain.zones\";" >> /etc/named.conf
sed -i --follow-symlinks "s/domain/$domain/g" /etc/named.$domain.zones
sed -i --follow-symlinks "s/arpa/$arpa/g" /etc/named.$domain.zones
sed -i --follow-symlinks "s/domain/$domain/g" /var/named/$domain.zone
sed -i --follow-symlinks "s/domain/$domain/g" /var/named/$arpa.zone

/usr/sbin/named -c /etc/named.conf -u named -g
