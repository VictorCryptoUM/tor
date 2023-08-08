FROM archlinux:latest

#RUN pacman -Syu --noconfirm
RUN pacman -Sy tor sudo --noconfirm

RUN chown -R tor:tor /var/lib/tor/

#RUN chmod 700 -R /var/lib/tor/

COPY config/torrc.exit.conf /etc/tor/torrc

EXPOSE 9001 9030

ENTRYPOINT ["/usr/bin/sudo", "-u", "tor", "/usr/bin/tor"]
#ENTRYPOINT [ "/usr/bin/tor" ]
#CMD ["/bin/bash"]
