#!/bin/bash

# 杀掉旧的 HuaZhi 进程
pid=$(pgrep -f HuaZhi)
if [ -n "$pid" ]; then
    kill -2 $pid
    sleep 2
fi

# 设置文件描述符限制
ulimit -n 65535

# 启动 HuaZhi
echo "Starting HuaZhi..."
./HuaZhi start &
HUAZHI_PID=$!
sleep 5

# 杀掉旧的 DGPServer 进程
dgp_pid=$(pgrep -f DGPServer)
if [ -n "$dgp_pid" ]; then
    pkill -9 DGPServer
    sleep 1
fi

# 启动 DGPServer
echo "Starting DGPServer..."
./DGPServer 1 &
DGPSERVER_PID=$!

echo "HuaZhi PID: $HUAZHI_PID"
echo "DGPServer PID: $DGPSERVER_PID"
echo "All services started, waiting for processes..."

# 等待所有后台进程，保持主进程运行
wait
