FROM debian:stable

RUN useradd -ms /bin/bash itor

RUN apt update && apt install -y apt-transport-https ca-certificates wget gnupg

RUN echo "deb [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org stable main" >> /etc/apt/sources.list.d/tor.list
RUN echo "deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org stable main" >> /etc/apt/sources.list.d/tor.list

RUN wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null

RUN apt update && apt install -y tor deb.torproject.org-keyring
#RUN apt update && apt install -y tor

USER itor

COPY config/torrc.exit.conf /etc/tor/torrc

EXPOSE 9001 9030

ENTRYPOINT ["/usr/bin/tor"]