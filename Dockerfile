FROM dockerfile/nginx
MAINTAINER Harald Westphal <h.westphal@gmx.de>

RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get -q -y update && \
  apt-get -q -y install fcgiwrap && \
  sed -i 's/^\(user .*\)$/user root;/' /etc/nginx/nginx.conf

CMD spawn-fcgi -s /var/run/fcgiwrap.sock /usr/sbin/fcgiwrap && nginx
