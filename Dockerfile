FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="Nugget 中文社区入口页"
LABEL org.opencontainers.image.description="Nugget 中文社区官网与交互壁纸库的静态入口页面。"
LABEL org.opencontainers.image.url="https://neo-0x00.github.io/click-nugget/"
LABEL org.opencontainers.image.source="https://github.com/Neo-0x00/click-nugget"
LABEL org.opencontainers.image.documentation="https://nugget.click/"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY docs/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1
