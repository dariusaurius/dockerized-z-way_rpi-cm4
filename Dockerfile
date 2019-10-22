FROM arm32v7/debian:stretch-slim

RUN apt-get update && apt-get -y install dirmngr apt-transport-https ca-certificates wget

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x7E148E3C
RUN echo "deb https://repo.z-wave.me/z-way/raspbian buster main" > /etc/apt/sources.list.d/z-wave-me.list

RUN apt-get update && apt-get -y install z-way-full && apt-get clean

RUN echo razberry > /etc/z-way/box_type

COPY config.xml /opt/z-way-server/config.xml
COPY zway-start.sh /opt/zway-start.sh

RUN chmod +x /opt/zway-start.sh && chmod ug+rwx /opt/z-way-server/config.xml

WORKDIR /opt/z-way-server/

CMD ["/opt/z-way-server/z-way-server"]
