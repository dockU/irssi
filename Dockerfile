FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

USER root

VOLUME ["/home/jchen/.irssi", "/home/jchen/irclogs"]

EXPOSE 113

RUN pacman -Syu --noconfirm --needed screen vim-minimal irssi figlet wget oidentd

RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN /usr/bin/useradd -m -d /home/jchen jchen
ADD https://github.com/bsdlp.keys /home/jchen/.ssh/authorized_keys
RUN passwd -d jchen
RUN chown -R jchen:jchen /home/jchen

ENV HOME /home/jchen

ADD oidentd_run /service/oidentd/run

ADD attach_irssi.sh /home/jchen/attach_irssi.sh
RUN /bin/echo "/home/jchen/attach_irssi.sh" >> /home/jchen/.bash_profile
