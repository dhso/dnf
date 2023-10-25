# Base Image
FROM dhso/centos:6.9

MAINTAINER dhso

# 更新Repo
RUN yum update -y && yum install -y gcc gcc-c++ make zlib-devel initscripts openssl-devel libffi-devel

ADD build/Centos6-with-py3/openssl-1.1.1w.tar.gz /tmp/
RUN cd /tmp/openssl-1.1.1w && ./config --prefix=/usr/local/openssl no-zlib && make && make install && \
    ln -sf /usr/local/openssl/include/openssl /usr/include/openssl && \
    ln -sf /usr/local/openssl/lib/libssl.so.1.1 /usr/local/lib/libssl.so && \
    ln -sf /usr/local/openssl/bin/openssl /usr/bin/openssl && \
    echo "/usr/local/openssl/lib/" >> /etc/ld.so.conf && \
    ldconfig -v

# 编译Python3[安装supervisor]
ADD build/Centos6-with-py3/Python-3.7.17.tgz /tmp/
RUN cd /tmp/Python-3.7.17 && ./configure --prefix=/usr/local --with-openssl=/usr/local/openssl --enable-shared && make && make install && \
    ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
    cp libpython3.7m.so.1.0  /usr/lib64 && \
    echo "/usr/local/python3/lib/" >> /etc/ld.so.conf && \
    ldconfig -v

ADD build/Centos6-with-py3/setuptools-68.2.2.tar.gz /tmp/
RUN cd /tmp/setuptools-68.2.2 && python3.7 setup.py install

ADD build/Centos6-with-py3/pip-18.1.tar.gz /tmp/
RUN cd /tmp/pip-18.1 && python3.7 setup.py install

ADD build/Centos6-with-py3/supervisord.conf /etc/supervisord.conf
RUN pip install supervisor && mkdir -p /etc/supervisor/conf.d/ && \
    pip install wheel && \
    pip install pyinstaller && mkdir /src/ && \
    yum clean all

COPY build/Centos6-with-py3/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME /src/

# 切换工作目录
WORKDIR /src/

ENTRYPOINT ["/docker-entrypoint.sh"]
