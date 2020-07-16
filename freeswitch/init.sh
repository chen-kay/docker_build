#！/bin/bash
docker run -d -it --name=freeswitch -p 15060:15060/udp -p 15080:15080/udp -p 15066:15066 -p 17443:17443 -p 18021:18021 freeswitch /bin/bash