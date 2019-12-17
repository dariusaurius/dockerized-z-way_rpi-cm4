FROM arm32v7/debian:buster-slim

RUN apt-get update && apt-get install tar

RUN mkdir -p /opt/z-way-server
RUN mkdir -p /opt/z-way-server/config
RUN mkdir -p /opt/z-way-server/automation/storage
RUN mkdir -p /opt/z-way-server/htdocs/smarthome/user
RUN mkdir -p /opt/z-way-server/ZDDX
RUN mkdir -p /opt/z-way-backup

WORKDIR /opt/

CMD tar -xvzf z-way-backup/backup.tar.gz --no-same-owner
