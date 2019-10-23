FROM arm32v7/debian:stretch

RUN apt-get update && apt-get -y install dirmngr apt-transport-https ca-certificates wget procps sharutils gawk libc-ares2 libavahi-compat-libdnssd-dev libarchive-dev unzip python libcurl4-openssl-dev zlib1g-dev libc-ares-dev libv8-dev

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x7E148E3C && echo "deb https://repo.z-wave.me/z-way/raspbian stretch main" > /etc/apt/sources.list.d/z-wave-me.list

RUN apt-get update && apt-get install -o Dpkg::Options::="--force-confmiss" -y z-way-server webif

RUN echo razberry > /etc/z-way/box_type

COPY config.xml /opt/z-way-server/config.xml
COPY zway-start.sh /opt/zway-start.sh

RUN chmod +x /opt/zway-start.sh && chmod ug+rwx /opt/z-way-server/config.xml

WORKDIR /opt/z-way-server

ENV LD_LIBRARY_PATH=/opt/z-way-server/libs:$LD_LIBRARY_PATH

EXPOSE 8083

CMD ["/opt/zway-start.sh"]
