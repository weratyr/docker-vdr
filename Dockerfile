###### Supervisord image
FROM debian:bullseye

ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get update &&  apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8 

RUN mkdir -p /var/lib/video
#RUN apt-get install -y build-essential libssl-dev libboost-dev libpcre3-dev libmagick++-dev cdbs dpatch quilt libpoco-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxcb-util0-dev autofs  python3-dbus  libjansson-dev  libsqlite3-dev libtntdb-dev nmap
RUN apt-get install -y vdr vdr-plugin-streamdev-server vdr-plugin-epgsearch vdr-plugin-live nmap procps vim
VOLUME /etc/vdr 
VOLUME /var/lib/video
VOLUME /var/lib/vdr

COPY channels.conf /var/lib/vdr
COPY plugins/streamdevhosts.conf /etc/vdr/plugins

CMD [ "/usr/lib/vdr/runvdr" ]
