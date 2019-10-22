#!/bin/bash

echo "Start mongoose http server"
/etc/init.d/mongoose start

echo "Start z-way-server"
/opt/z-way-server/z-way-server
