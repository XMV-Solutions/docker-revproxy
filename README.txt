---------------------------------------
         REVERSE PROXY DOCKER
---------------------------------------


This is basically just an Apache httpd 
with a loop script (/readConfig.sh) that checks every minute for changes 
in the httpd.conf file in this shared volume (/rpVolume).

INSTRUCTIONS:
1. Edit httpd.conf and save (use reverseproxy_httpd.conf as an example)
2. Wait for a minute
3. Done

Of course, you have to have run this docker image correctly:
- map your ports (probably -p 80:80 and/or -p 443:443)
- mount the volume (something like -v /usr/local/bin/rpVolume:/rpVolume)
  I guess this at least worked, since you are reading this file!
- maybe mount the htdocs volume, if you want to use xmvsolutions/reverseproxy as an HTML webserver (something like -v /host/path/to/htdocs:/usr/local/apache2/htdocs)

