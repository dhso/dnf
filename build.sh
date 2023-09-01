# 构建基础镜像
docker build -f $(pwd)/build/Centos6-DNF-Base/Dockerfile -t dhso/centos:6.9 $(pwd)
# 构建DNF服务
docker build -f $(pwd)/build/Centos6-DNF/Dockerfile -t dhso/dnf:centos6.9 $(pwd)
