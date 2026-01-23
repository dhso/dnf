# ls-gate (雷神)

## 如何使用

将本目录下的ls-gate.tar.gz、ls-gate.conf复制到/data/data/conf.d目录下。
由于GLIBC版本问题，暂时需要使用centos6/centos7系列的镜像。

## 映射端口

本插件默认会使用容器的8188端口，我们需要在docker的启动命令中加入端口映射，例如: -p 8188:8188/tcp

## 压缩
tar -zcvf ls-gate.tar.gz ls-gate

## 授权
Leishen-2025-Thunder-NICE-8888