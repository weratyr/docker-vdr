###### Supervisord image
FROM debian:bullseye

ENV DEBIAN_FRONTEND noninteractive 

RUN mkdir -p /var/lib/video
RUN apt-get update &&  apt-get install -y locales locales-all && apt-get install -y vdr vdr-plugin-streamdev-server vdr-plugin-epgsearch vdr-plugin-live && apt-get -y autoremove && apt-get clean

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo LANG="en_US.UTF-8" > /etc/default/locale && echo LANGUAGE="en_US:en" >> /etc/default/locale

VOLUME /etc/vdr 
VOLUME /var/lib/video
VOLUME /var/lib/vdr

COPY channels.conf /var/lib/vdr
COPY plugins/streamdevhosts.conf /etc/vdr/plugins

CMD [ "/usr/lib/vdr/runvdr" ]
