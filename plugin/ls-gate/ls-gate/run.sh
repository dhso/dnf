#!/bin/bash

set -e

CURR_PATH=`pwd`

echo "Current path ${CURR_PATH}"

ROOT_PATH="/root"
GAME_PATH="/home/neople/game"
ROOT_TAR_PATH="${CURR_PATH}${ROOT_PATH}"
GAME_TAR_PATH="${CURR_PATH}${GAME_PATH}"

echo "Stopping existing processes..."
pkill -f StartLogin || true
pkill -f Gatewayd || true
pkill -f Restart || true
sleep 2

# Install
echo "Install ls gate"
cp -r ${ROOT_TAR_PATH}/* ${ROOT_PATH}
cp -r ${GAME_TAR_PATH}/* ${GAME_PATH}

echo "Start ls gate"
cd ${ROOT_PATH}
chmod +x ./Gatewayd ./StartLogin ./Restart

# 前台运行，保持进程
./Restart
