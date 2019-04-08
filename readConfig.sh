#!/bin/sh

# CreateConfFiles
source /constants.sh

exec > >(tee -a "$rpLOGFILE") 2>&1

/usr/local/apache2/bin/httpd -k stop ; /usr/local/apache2/bin/httpd -k start
 
while :
do
	TIMESTAMP=$(date +"%Y-%m-%d %H-%M-%S")
	if [ ! -f $rpCONFIGFILE ] ; then
		# Copy Startup Files
		cp -r "$rpVOLUMESTARTUP"/* $rpVOLUME
		echo "$TIMESTAMP Startup files copied into volume."

	elif  [ ! "$(cat /config.sum 2>&1)" == "$(sha1sum $rpCONFIGFILE)" ] ; then 
		# When Configfile changed, copy to apache2
		cp -f $rpCONFIGFILE $rpAPACHEHTTPCONF
		sha1sum $rpCONFIGFILE > /config.sum
		echo "$TIMESTAMP Updated config. Restart apache..."
		/usr/local/apache2/bin/httpd -k restart
	#else
	#	echo "$TIMESTAMP ... nothing happening ..."
	fi
	sleep $rpDELAY
done
