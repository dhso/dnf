# Base Image
FROM dhso/centos:6.9-DNF-Base

MAINTAINER dhso

# 定义默认环境变量
ENV AUTO_PUBLIC_IP=false
ENV PRELOAD_LD=true
ENV PUBLIC_IP=127.0.0.1
ENV DNF_DB_PASSWORD=uu5!^%jg
ENV DP2=false
ENV CUSTOM_MYSQL_PORT=6033

# RUN yum update -y && yum install -y p7zip && yum clean all

# 将模板添加到模版目录下[后续容器启动需要先将环境变量替换,再将文件移动到正确位置]
ADD build/Centos6-DNF-HZ/neople /home/template/neople
ADD build/Centos6-DNF-HZ/root /home/template/root
ADD build/Centos6-DNF-HZ/privatekey.pem /home/template/init/
ADD build/Centos6-DNF-HZ/publickey.pem /home/template/init/
# 初始化sql脚本
COPY build/Centos6-DNF-HZ/init_sql.tgz /home/template/init/
# 初始化版本文件
COPY build/Centos6-DNF-HZ/Script.tgz /home/template/init/
# 初始化等级补丁
ADD build/Centos6-DNF-HZ/df_game_r /home/template/init/
# 初始化脚本
ADD build/Centos6-DNF-HZ/init.sh /home/template/init/
# 网关配置文件
ADD build/Centos6-DNF-HZ/config.ini /home/template/init/
# 启动脚本
ADD build/Centos6-DNF-HZ/docker-entrypoint.sh /
# TEA算法
ADD build/Centos6-DNF-HZ/TeaEncrypt /
# DP插件
ADD build/Centos6-DNF-HZ/df_game_r.lua /home/template/init/
ADD build/Centos6-DNF-HZ/dp2.8r2.tgz /home/template/init/
# 优化CPU
ADD build/Centos6-DNF-HZ/libhook.so /lib/
# 网关依赖
ADD build/Centos6-DNF-HZ/usr /usr
# 放开tmp目录权限
WORKDIR /tmp
RUN chmod -R 777 /tmp
# 该目录用于存放版本文件
RUN mkdir /data
RUN mkdir -pv /home/neople/game/log/ && \
    mkdir -pv /home/neople/game/dnfImg/

# 切换工作目录
WORKDIR /root
CMD ["/bin/bash", "/docker-entrypoint.sh"]
