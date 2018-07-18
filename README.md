# vnf-sniffer

Proof of concept implementation of a VNF packet sniffer that is deployable in [son-emu](https://github.com/sonata-nfv/son-emu).

## Usage

```
# Pull sniffer image
docker pull tehusername/vnf-sniffer

# Run containernet as a container
docker run --name vim-emu -it --rm --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock vim-emu-img /bin/bash

# Bash into containernet (separate terminal)
docker exec -it vim-emu /bin/bash

# Run DC topology
sudo python examples/default_single_dc_topology.py

# Instantiate things

vim-emu compute start -d dc1 -n client -i sonatanfv/sonata-empty-vnf
vim-emu compute start -d dc1 -n sniffer -i tehusername/vnf-sniffer --net '(id=input,ip=200.0.10.21/24),(id=output,ip=201.0.10.22/24)'
vim-emu compute start -d dc1 -n server -i sonatanfv/sonata-empty-vnf

# Do the connection
# client <-> sniffer <-> server

vim-emu network add -b -src client:client-eth0 -dst sniffer:input
vim-emu network add -b -src sniffer:output -dst server:server-eth0
```
