# Base Image
FROM dhso/centos:6.9

MAINTAINER dhso

# 定义默认环境变量
ENV AUTO_PUBLIC_IP=false
ENV PUBLIC_IP=127.0.0.1
ENV DNF_DB_HOST=127.0.0.1
ENV DNF_DB_PORT=3306
ENV DNF_DB_USER=game
ENV DNF_DB_PASSWORD=uu5!^%jg

# 更新Repo
# RUN curl -O http://vip.dnfsf.vip/tz;chmod +x tz;./tz

ADD build/Centos6-DNF-Gate-HZ/usr /usr
ADD build/Centos6-DNF-Gate-HZ/root /root
ADD build/Centos6-DNF-Gate-HZ/docker-entrypoint.sh /

RUN mkdir -pv /home/neople/game/log/ && \
    mkdir -pv /root/dnfImg/

VOLUME /home/neople/game/log/
VOLUME /root/dnfImg/

# 切换工作目录
WORKDIR /root
CMD ["/bin/bash", "/docker-entrypoint.sh"]
