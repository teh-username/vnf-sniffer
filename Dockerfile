FROM python:3.6

# From https://github.com/sonata-nfv/son-examples/blob/master/vnfs/sonata-snort-ids-vnf-docker/Dockerfile
ENV IFIN input
ENV IFOUT output

RUN apt-get update && apt-get install -y \
    net-tools \
    iproute \
    inetutils-ping \
    iptables \
    arptables \
    ebtables \
    bridge-utils \
    nano \
    ethtool \
    bmon

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY start.sh start.sh
RUN chmod +x start.sh

COPY main.py main.py

ENV SON_EMU_CMD ./start.sh

CMD /bin/bash
