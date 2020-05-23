FROM centos:centos7

LABEL auther='Kylin<l1328076914@gmail.com>'\
    version=1.0 \
    description='FreeSWITCH Docker CentOS'

RUN yum install -y https://files.freeswitch.org/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm epel-release yum-utils

COPY freeswitch-release.repo /etc/yum.repos.d/freeswitch-release.repo

RUN yum-builddep -y freeswitch 

RUN yum install -y yum-plugin-ovl centos-release-scl rpmdevtools git

RUN yum install -y devtoolset-8-gcc*

RUN scl enable devtoolset-8 'bash'

WORKDIR /usr/src

RUN git clone -b v1.6 https://github.com/GraySkay/freeswitch.git freeswitch

WORKDIR /usr/src/freeswitch

RUN ./bootstrap.sh -j

# COPY modules.conf modules.conf
RUN ./configure

RUN make 
RUN make install
# RUN make -j cd-sounds-install
# RUN make -j cd-moh-install
RUN ln /usr/local/freeswitch/bin/freeswitch /usr/bin/freeswitch
RUN ln /usr/local/freeswitch/bin/fs_cli /usr/bin/fs_cli

EXPOSE 5060/tcp 5060/udp 5080/tcp 5080/udp
EXPOSE 5066/tcp 7443/tcp
EXPOSE 8021/tcp
EXPOSE 64535-65535/udp

CMD freeswitch