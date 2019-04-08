#!/bin/sh

rpVOLUMESTARTUP="/rpVolumeStartupFiles"
rpVOLUME="/rpVolume"
rpLOGFILE="$rpVOLUME/reverseproxy.log"
rpCONFIGFILE="$rpVOLUME/httpd.conf"
rpAPACHEHTTPCONF="/usr/local/apache2/conf/httpd.conf"
rpDELAY=1m


export rpVOLUMESTARTUP rpVOLUME rpCONFIGFILE rpAPACHEHTTPCONF rpDELAY rpLOGFILE