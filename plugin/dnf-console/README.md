# dnf-console

## github doc
https://github.com/localhostjason/dnf-console

## 如何使用
将本目录下的dnf-console.tgz、dnf-console.conf复制到/data/data/conf.d目录下。

## 映射端口
本插件默认会使用容器的8088端口，我们需要在docker的启动命令中加入端口映射，例如: -p 882:8088/tcp
