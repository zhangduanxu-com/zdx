#!/bin/bash
set -e

# 1. 获取当前主机名并确保 /etc/hosts 中已登记
H=$(hostname)
grep -q "$H" /etc/hosts || echo "127.0.0.1 $H" >> /etc/hosts

# 2. 安装最新官方 Docker 版本
curl -fsSL https://get.docker.com | sh

# 3. 启动 Docker 并设置为开机自启
systemctl enable --now docker

# 4. 重启 Docker 服务，确保启动成功
systemctl restart docker

# 5. 显示 Docker 服务当前状态
systemctl status docker --no-pager
