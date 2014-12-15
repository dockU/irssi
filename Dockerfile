FROM docku/base
MAINTAINER Jon Chen <docku@burrito.sh>

EXPOSE 113

USER root
RUN pacman -Syu --noconfirm --needed irssi figlet oidentd cpanminus wget make

RUN /usr/bin/vendor_perl/cpanm -n LWP::UserAgent LWP::Protocol::https Crypt::SSLeay

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

ADD oidentd_run /service/oidentd/run

ADD attach_irssi.sh /root/attach_irssi.sh
RUN /bin/echo "/root/attach_irssi.sh" >> /root/.bashrc
