FROM debian:bullseye-slim

RUN apt-get update && apt-get install tar

RUN mkdir -p /opt/z-way-server
RUN mkdir -p /opt/z-way-server/config
RUN mkdir -p /opt/z-way-server/automation/storage
RUN mkdir -p /opt/z-way-server/htdocs/smarthome/user
RUN mkdir -p /opt/z-way-server/ZDDX
RUN mkdir -p /opt/z-way-backup

WORKDIR /opt/

CMD tar -zvcf backup.tar.gz z-way-server && cp backup.tar.gz z-way-backup/backup.tar.gz && rm backup.tar.gz
