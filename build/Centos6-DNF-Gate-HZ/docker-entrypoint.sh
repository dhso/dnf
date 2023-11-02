# 获取公网ip
if $AUTO_PUBLIC_IP;
then
  PUBLIC_IP=`curl -s http://pv.sohu.com/cityjson?ie=utf-8|awk -F\" '{print $4}'`
  echo "public ip: $PUBLIC_IP"
  sleep 5
  echo
fi

# 替换环境变量
find /root -type f -name "config.ini" -print0 | xargs -0 sed -i "s/DB_HOST/$DNF_DB_HOST/g"
find /root -type f -name "config.ini" -print0 | xargs -0 sed -i "s/DB_PORT/$DNF_DB_PORT/g"
find /root -type f -name "config.ini" -print0 | xargs -0 sed -i "s/DB_GAME_PASSWORD/$DNF_DB_GAME_PASSWORD/g"

chmod 777 /root/*

cd /root
# 启动服务
./run