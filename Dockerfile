FROM docku/oidentd
MAINTAINER Jon Chen <docku@burrito.sh>

USER root
RUN pacman -Syu --noconfirm --needed irssi figlet wget

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

ADD attach_irssi.sh /home/jchen/attach_irssi.sh
RUN /bin/echo "/home/jchen/attach_irssi.sh" >> /home/jchen/.bashrc
