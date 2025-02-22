# 构建CentOS6.9
docker build -f $(pwd)/build/Centos6/Dockerfile -t dhso/centos:6.9 $(pwd)
# 构建DNF基础镜像
docker build -f $(pwd)/build/Centos6-DNF-Base/Dockerfile -t dhso/centos:6.9-DNF-Base $(pwd)
# 构建DNF镜像
docker build -f $(pwd)/build/Centos6-DNF/Dockerfile -t dhso/dnf:with-ty-zl $(pwd)
# 构建CentOS6.9 Py3镜像
docker build -f $(pwd)/build/Centos6-with-py3/Dockerfile -t dhso/centos:6.9-py3 $(pwd)
# 构建花枝网关镜像
docker build -f $(pwd)/build/Centos6-DNF-Gate-HZ/Dockerfile -t dhso/dnf-gate:hz $(pwd)
# 构建花枝网关集成镜像
docker build -f $(pwd)/build/Centos6-DNF-HZ/Dockerfile -t dhso/dnf:hz $(pwd)