#!/bin/bash

set -e

CURR_PATH=`pwd`

echo "Current path ${CURR_PATH}"

# 使用独立目录存放 hz-gate 的库文件，避免覆盖系统库导致 OpenSSL 问题
HZ_LIB64_PATH="/opt/hz-gate/lib64"
ROOT_PATH="/root"
LIB64_TAR_PATH="${CURR_PATH}/lib64"
ROOT_TAR_PATH="${CURR_PATH}/root"


# Install
echo "Install hz gate"
# 创建独立的库目录，不覆盖系统 /usr/lib64
mkdir -pv ${HZ_LIB64_PATH}
cp -r ${LIB64_TAR_PATH}/* ${HZ_LIB64_PATH}
cp -r ${ROOT_TAR_PATH}/* ${ROOT_PATH}

echo "Start hz gate"
pushd ${ROOT_PATH}
# 使用 LD_LIBRARY_PATH 让 hz-gate 程序使用自己的库
export LD_LIBRARY_PATH="${HZ_LIB64_PATH}:${LD_LIBRARY_PATH}"
./start-hz-gate.sh
popd