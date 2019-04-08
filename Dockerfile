FROM httpd:latest

MAINTAINER David Koller <david.koller@xmv-solutions.com>

# add files to docker image
ADD *httpd.conf README.txt /rpVolumeStartupFiles/
# - httpd.conf
# - reverseProxy_httpd.conf
# - reverseProxy_ssl_httpd.conf
# - README.txt
ADD constants.sh /constants.sh
ADD readConfig.sh /readConfig.sh
RUN chmod 755 /rpVolumeStartupFiles/*
RUN chmod 755 /*.sh

# expose ports
EXPOSE 80
EXPOSE 443

# Expose Apache Document root
VOLUME ["/usr/local/apache2/htdocs"]

# provide volume to host
VOLUME ["/rpVolume"]

# define startup command (run script)
CMD ["bash", "/readConfig.sh"]