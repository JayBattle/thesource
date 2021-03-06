FROM ubuntu

WORKDIR /home
ARG SaltMasterIP=${SaltMasterIP}

COPY StartupScript.sh /home/
COPY .rtorrent.rc /home/

RUN apt-get update
RUN apt-get -y install dos2unix
RUN dos2unix /home/StartupScript.sh /home/StartupScript.sh
RUN chmod +x /home/StartupScript.sh
RUN apt-get -y install wget
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN apt-get -y install dnsutils
RUN apt-get -y install net-tools
RUN apt-get install psmisc
RUN apt-get install less
RUN curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
RUN sh bootstrap-salt.sh
RUN apt-get update
RUN sed -i 's/#master: salt/master: $SaltMasterIP/g' /etc/salt/minion
RUN cat /home/StartupScript.sh
RUN apt update && \
       apt install -y wget && \
       wget -O /tmp/nordrepo.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb && \
       apt install -y /tmp/nordrepo.deb && \
       apt update && \
       apt install -y nordvpn=3.7.4 && \
       apt remove -y wget nordvpn-release
RUN apt-get -y install rtorrent
ENTRYPOINT ["/home/StartupScript.sh"]
CMD [""]