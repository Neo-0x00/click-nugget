# Nugget 中文社区入口页

这是一个面向用户的 Nugget 中文社区静态入口页，用于聚合官网、交互壁纸库、iOS 动态壁纸资源和无越狱桌面美化说明。

## 官方入口

- Nugget 中文社区官网：[https://nugget.click/](https://nugget.click/)
- Nugget 交互壁纸库：[https://wallpaper.nugget.click/](https://wallpaper.nugget.click/)
- GitHub Pages 页面：[https://neo-0x00.github.io/click-nugget/](https://neo-0x00.github.io/click-nugget/)

## 页面内容

- 给 iPhone 与 iPad 用户提供动态交互壁纸入口。
- 引导用户前往 Nugget 官网查看下载、教程和社区支持。
- 引导用户前往交互壁纸库浏览、预览和下载壁纸资源。
- 在页面不可见的 `<head>` 中保留 SEO 标题、描述、关键词、Open Graph、Twitter Card、JSON-LD、favicon、manifest、robots 和 sitemap。

## Docker 镜像

项目提供了一个 Nginx 静态镜像，镜像内容来自 `docs/` 目录。

镜像启动后会在容器的 `80` 端口提供页面服务：

```bash
docker run --rm -p 8080:80 <dockerhub-namespace>/click-nugget:latest
```

然后访问：

```text
http://localhost:8080
```

## GitHub Actions 自动发布

仓库内的 `.github/workflows/docker-publish.yml` 会在以下场景自动构建并推送 Docker 镜像：

- 推送到 `main` 分支。
- 推送 `v*` 标签。
- 在 GitHub Actions 页面手动触发 `workflow_dispatch`。

默认镜像名：

```text
<DOCKERHUB_USERNAME>/click-nugget
```

默认标签：

- `latest`：`main` 分支构建。
- `sha-<commit>`：每次提交构建。
- `v*`：版本标签构建。

## 需要配置的 GitHub Secrets

在 GitHub 仓库中进入 `Settings` -> `Secrets and variables` -> `Actions`，添加：

```text
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
```

`DOCKERHUB_TOKEN` 建议使用 Docker Hub Access Token，不要直接使用账号密码。这个 token 需要具备推送镜像和更新仓库说明页的权限。

## Docker Hub Overview

工作流会使用 `README.md` 同步 Docker Hub 仓库说明页。这样 Docker Hub 页面也会展示 Nugget 中文社区官网和交互壁纸库链接：

- [https://nugget.click/](https://nugget.click/)
- [https://wallpaper.nugget.click/](https://wallpaper.nugget.click/)

如果 Docker Hub 仓库尚未创建，请先在 Docker Hub 创建 `click-nugget` 仓库，或让第一次推送自动创建仓库后再重新运行 Actions。

## 本地静态预览

无需构建即可直接打开：

```text
docs/index.html
```

也可以用任意静态文件服务器托管 `docs/` 目录。

## 项目结构

```text
.
├── .github/workflows/docker-publish.yml
├── docs/
│   ├── favicon/
│   ├── index.html
│   ├── robots.txt
│   ├── sitemap.xml
│   └── styles.css
├── Dockerfile
├── nginx.conf
└── README.md
```
