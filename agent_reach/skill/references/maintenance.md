# 维护

更新失败、浏览器起不来、渠道报错或用户要卸载时读这份。

- 更新：`kang-eyes update` 升级 Kang Eyes Agent、已加渠道的工具和 skill；`kang-eyes update --check` 只查有没有新版本。只在用户同意后执行。
- 状态：`kang-eyes doctor --text` 读本地状态，不联网；`kang-eyes check <渠道> --text` 联网实测一次（`--search` 只测搜索/职位）。安装成功不等于实测通过。
- 浏览器：`kang-eyes browser status` 看状态，`browser setup` 准备内核和扩展，`browser stop` 关闭；CloakBrowser 下载失败后修好网络可 `browser setup --retry-cloak`。
- 分清失败环节：依赖下载、浏览器连接、登录、网页加载、平台限流各是各的；网络超时不要说成登录失效。
- 上游工具出错：记下错误和版本，用户同意后 `kang-eyes update` 一次；不改上游工具的安装文件，不循环重试。
- `PLATFORM_BLOCKED`、`RATE_LIMITED`、`NEED_LOGIN`、`BUSY` 停止本次尝试，等用户处理后再继续，不反复开窗。
- 密钥和代理：`kang-eyes configure groq-key | openai-key | proxy | github-token`，值由用户本人提供。
- 端口冲突（`Port <n> belongs to an unmanaged browser`）：别的程序占了专用浏览器端口（默认 9222）。不要关掉用户的那个程序；用户同意后 `kang-eyes configure browser-port <空闲端口>`。
- 卸载：先 `kang-eyes uninstall --dry-run` 给用户看范围，确认后 `kang-eyes uninstall`。只删 Kang Eyes 自己装的东西，用户的其他文件和浏览器保留。
