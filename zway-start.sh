#!/bin/bash

if [[ ! -e /opt/initialized ]]; then
        echo "First start, getting Remote ID"
        apt-get update &> /opt/initialized && apt-get -y install zbw &> /opt/initialized
else
        echo "Start zbw_connect"
        /etc/init.d/zbw_connect start
fi

echo "Start mongoose http server"
/etc/init.d/mongoose start

echo "Start z-way-server"
cd /opt/z-way-server
./z-way-server
