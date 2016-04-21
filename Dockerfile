FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

USER root

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

EXPOSE 113

RUN pacman -Syu --noconfirm --needed screen vim-minimal irssi figlet wget oidentd

RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
ADD https://github.com/bsdlp.keys /root/.ssh/authorized_keys
ENV HOME /root

ADD oidentd_run /service/oidentd/run

ADD attach_irssi.sh /root/attach_irssi.sh
RUN /bin/echo "/root/attach_irssi.sh" >> /root/.bash_profile
