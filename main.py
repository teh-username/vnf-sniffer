from scapy.all import sniff, wrpcap


def record_packet(packet):
    wrpcap('vnf.pcap', packet, append=True)
    packet.show()


sniff(prn=record_packet)
