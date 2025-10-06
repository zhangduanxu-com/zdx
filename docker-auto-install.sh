#!/bin/bash
set -e

# 修复主机名未登记问题
H=$(hostname)
grep -q "$H" /etc/hosts || echo "127.0.0.1 $H" >> /etc/hosts

# 安装 Docker（官方源最新版）
curl -fsSL https://get.docker.com | sh

# 启动并设置开机自启
systemctl enable --now docker >/dev/null 2>&1

# 重启 Docker 服务（确保启动成功）
systemctl restart docker

# 显示 Docker 服务状态
sudo systemctl status docker --no-pager
