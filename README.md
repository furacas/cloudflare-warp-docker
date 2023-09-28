# Cloudflare Warp Docker 使用指南

## Docker

```
docker run -d --name cloudflare-warp -p 40000:40000 -e WARP_LICENSE=YOUR_LICENSE_KEY furacas/cloudflare-warp:latest
```

确保将 YOUR_LICENSE_KEY 替换为您的许可证。

## Docker Compose

复制以下内容创建 docker-compose.yml 文件。

```
version: "3.4"

services:
  warp:
    image: furacas/cloudflare-warp:latest
    container_name: cloudflare-warp
    restart: always
    environment:
      - WARP_LICENSE=YOUR_LICENSE_KEY
    ports:
      - 40000:40000

```

1. 替换 YOUR_LICENSE_KEY 为您的许可证。
2. 运行 `docker-compose up -d` 启动容器。

## 验证

```
curl -x socks5://127.0.0.1:40000 -sL  https://cloudflare.com/cdn-cgi/trace | grep warp
```

如果显示`warp=on`证明连接成功
