#!/bin/bash
#salt-minion -d start
service nordvpn start && sleep 20 && nordvpn login -u ${NordVPNUser} -p ${NordVPNPass} && nordvpn connect
nordvpn set killswitch on && nordvpn set autoconnect on
cp .rtorrent.rc ~/.rtorrent.rc
rtorrent
/bin/bash