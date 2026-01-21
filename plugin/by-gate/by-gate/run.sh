#!/bin/bash

set -e

CURR_PATH=`pwd`

echo "Current path ${CURR_PATH}"

GAME_PATH="/home/neople/game"
ROOT_PATH="/root"
GAME_TAR_PATH="${CURR_PATH}/home/neople/game"
ROOT_TAR_PATH="${CURR_PATH}/root"


# Install
echo "Install by gate"
cp -r ${GAME_TAR_PATH}/* ${GAME_PATH}
cp -r ${ROOT_TAR_PATH}/* ${ROOT_PATH}

echo "Start by gate"
pushd ${ROOT_PATH}
./start-gate.sh
popd