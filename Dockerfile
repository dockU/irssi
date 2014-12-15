FROM docku/base
MAINTAINER Jon Chen <docku@burrito.sh>

EXPOSE 113

USER root
RUN pacman -Syu --noconfirm --needed irssi figlet oidentd wget

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

ADD oidentd_run /service/oidentd/run

ADD attach_irssi.sh /home/jchen/attach_irssi.sh
RUN /bin/echo "/home/jchen/attach_irssi.sh" >> /home/jchen/.bashrc
