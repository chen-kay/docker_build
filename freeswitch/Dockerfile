FROM centos:centos7

LABEL auther='Kylin<l1328076914@gmail.com>'\
    version=1.0 \
    description='FreeSWITCH Docker CentOS'

RUN yum install -y https://files.freeswitch.org/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm epel-release yum-utils

COPY freeswitch-release.repo /etc/yum.repos.d/freeswitch-release.repo

RUN yum-builddep -y freeswitch 

RUN yum install -y lsof htop

WORKDIR /usr/local

COPY freeswitch.tar.gz freeswitch.tar.gz
RUN tar -zxvf freeswitch.tar.gz

WORKDIR /usr/local/freeswitch

# gateway-url 为语音控制系统地址 default:11111
COPY xml_curl.conf.xml conf/autoload_configs/xml_curl.conf.xml

RUN ln bin/freeswitch /usr/bin/freeswitch
RUN ln bin/fs_cli /usr/bin/fs_cli

# 服务开放端口
# 5060/udp 5080/udp 5066/tcp 7443/tcp 语音端口
# 语音端口可在语音控制系统中设置
EXPOSE 15060/tcp 15060/udp 15080/tcp 15080/udp
EXPOSE 15066/tcp 17443/tcp
EXPOSE 18021/tcp


CMD ["freeswitch"]