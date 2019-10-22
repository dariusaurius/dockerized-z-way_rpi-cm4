#!/bin/bash

if [[ ! -e /opt/initialized ]]; then
        echo "First install, getting Remote ID"
        /etc/init.d/zbw_autosetup start
        touch /opt/initialized
else
        echo "Start zbw_connect"
        /etc/init.d/zbw_connect start
fi

echo "Start mongoose http server"
/etc/init.d/mongoose start

echo "Start z-way-server"
/etc/init.d/z-way-server start

sleep 10

tail -f /var/log/z-way-server.log
