#!/bin/bash

#从命令行传入端口号，保存到变量port
port=$1
let port2=$port+1

#使用 sed 命令替换配置文件中的端口
sed -i "s/$port/$port2/g" /etc/nginx/conf.d/abc.conf
head -n 10 /etc/nginx/conf.d/abc.conf
#重载 Nginx 配置
nginx -s reload
#开启新的端口
ufw allow $port2
ufw status
ss -ntl