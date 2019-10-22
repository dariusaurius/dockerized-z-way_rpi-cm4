FROM arm32v7/debian:stretch-slim

RUN apt-get update && apt-get -y install dirmngr apt-transport-https ca-certificates

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x7E148E3C
RUN echo "deb https://repo.z-wave.me/z-way/raspbian buster main" > /etc/apt/sources.list.d/z-wave-me.list

RUN apt-get update && apt-get -y install z-way-server webif

RUN mkdir /etc/z-way && echo razberry > /etc/z-way/box_type

#COPY config.xml /opt/z-way-server/config.xml
#RUN chmod ug+rwx /opt/z-way-server/config.xml

WORKDIR /opt/z-way-server/

CMD ["z-way-server"]
