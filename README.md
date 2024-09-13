## 测试环境

Kylin 24.03 x86_64

Wine 9.17-wow64 ([patched](https://github.com/mokurin000/Wine-Builds-Seewo/))

## 部署

安装patch好的wine。

```bash
./install_wine.sh
# 立即加载修改
source ~/.bashrc
```

首先把cabextract安装，winetricks会依赖此工具。

```bash
./install_deps.sh
```

应用希沃环境配置脚本。

```bash
./env_patch.sh
```

## 遗留问题

### 次要

- 无法输入中文。
- 无法方便地切换课件 （点击范围小）
- 视频播放较卡顿（DirectShow通病）
