#！/bin/bash
# docker run -d -it --name=freeswitch -p 5060:5060/udp -p 5080:5080/udp -p 5066:5066 -p 7443:7443 -p 8021:8021 freeswitch /bin/bash
docker-compose up -d --build