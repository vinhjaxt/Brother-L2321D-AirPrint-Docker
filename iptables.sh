# Allow LAN 192.168.1.0/24
iptables -A INPUT -s 192.168.1.0/24 -p tcp -m multiport --dports 22,631 -j ACCEPT

# Allow LAN 192.168.2.0/24
iptables -A INPUT -s 192.168.2.0/24 -p tcp -m multiport --dports 22,631 -j ACCEPT

# Allow CGNAT 100.64.0.0/10
iptables -A INPUT -s 100.64.0.0/10 -p tcp -m multiport --dports 22,631 -j ACCEPT

# UDP only needed for IPP/CUPS discovery (port 631)
iptables -A INPUT -s 192.168.1.0/24 -p udp --dport 631 -j ACCEPT
iptables -A INPUT -s 192.168.2.0/24 -p udp --dport 631 -j ACCEPT
iptables -A INPUT -s 100.64.0.0/10 -p udp --dport 631 -j ACCEPT

# Block everything else on these ports
iptables -A INPUT -p tcp -m multiport --dports 22,631 -j DROP
iptables -A INPUT -p udp --dport 631 -j DROP
