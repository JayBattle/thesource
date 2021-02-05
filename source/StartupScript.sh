#!/bin/bash
#salt-minion -d start
service nordvpn start && sleep 20 && nordvpn login -u jayxbattle@gmail.com -p j1^%WXXJwdFe && nordvpn connect
nordvpn set killswitch on && nordvpn set autoconnect on
cp .rtorrent.rc ~/.rtorrent.rc
rtorrent
/bin/bash