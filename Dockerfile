FROM debian:bullseye-slim

RUN apt-get update && apt-get -y install dirmngr apt-transport-https ca-certificates wget procps sharutils gawk libc-ares2 libavahi-compat-libdnssd-dev libarchive-dev unzip python libcurl4-openssl-dev zlib1g-dev libc-ares-dev libv8-dev

RUN dpkg --add-architecture armhf && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 5b2f88a91611e683 && echo "deb https://repo.z-wave.me/z-way/raspbian bullseye main" > /etc/apt/sources.list.d/z-wave-me.list

RUN apt-get update && apt-get install -o Dpkg::Options::="--force-confmiss" -y z-way-full z-way-server zbw webif

RUN echo razberry > /etc/z-way/box_type

COPY config.xml /opt/z-way-server/config.xml
COPY z-way-start.sh /opt/z-way-start.sh

RUN chmod +x /opt/z-way-start.sh && chmod ug+rwx /opt/z-way-server/config.xml

EXPOSE 8083

CMD ["/opt/z-way-start.sh"]
