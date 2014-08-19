FROM docku/base
MAINTAINER Jon Chen <docku@burrito.sh>

EXPOSE 113

USER root
RUN pacman -Syu --noconfirm --needed irssi figlet oidentd cpanminus wget

RUN /usr/bin/vendor_perl/cpanm LWP::UserAgent

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

ADD oidentd_run /service/oidentd/run

USER jchen
