#!/bin/sh
# Start the Axway API Gateway Services  

if [ -f /data/stunnel/server_stunnel.conf ] && [ -f /data/sockd/sockd.conf ];then  
        echo ""  
        echo "Starting in server mode"  
        echo ""  
        /usr/bin/stunnel /data/stunnel/server_stunnel.conf
		/usr/sbin/sockd -D -f /data/sockd/sockd.conf
elif [ -f /data/stunnel/client_stunnel.conf ];then
        echo ""  
        echo "Starting in client mode"  
        echo ""  
        /usr/bin/stunnel /data/stunnel/client_stunnel.conf
else 
	echo "Could not find any valid configuration"
	exit 1
fi

tail -f /data/stunnel/stunnel.log