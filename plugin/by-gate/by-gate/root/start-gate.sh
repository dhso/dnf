#!/bin/bash

# 杀掉旧的 Baoyu 进程
pid=$(pgrep -f Baoyu)
if [ -n "$pid" ]; then
    kill -2 $pid
    sleep 2
fi

# 设置文件描述符限制
ulimit -n 65535

# 启动 Baoyu
echo "Starting Baoyu..."
./Baoyu start &
BAOYU_PID=$!
sleep 5

# 杀掉旧的 Gatewayd 进程
dgp_pid=$(pgrep -f Gatewayd)
if [ -n "$dgp_pid" ]; then
    pkill -9 Gatewayd
    sleep 1
fi

# 启动 Gatewayd
echo "Starting Gatewayd..."
./Gatewayd &
GATEWAYD_PID=$!

echo "HuaZhi PID: $HUAZHI_PID"
echo "Gatewayd PID: $GATEWAYD_PID"
echo "All services started, waiting for processes..."

# 等待所有后台进程，保持主进程运行
wait
