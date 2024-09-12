## 测试环境

Kylin 24.03

Wine 9.17-wow64

## 部署命令

```bash
cd
filename="wine-9.17-amd64-wow64"
# 解压wine
tar xf 桌面/${filename}.tar.xz
# 解压 winetricks 下载缓存
tar xf 桌面/winetricks-cache.tar.gz  -C ~
# 拖入 winetricks 脚本备用
cp 桌面/winetricks ~/${filename}/bin
# 为 winetricks 设置可执行权限
chmod +x ~/${filename}/bin/winetricks
# Mono安装（？）
wine msiexec /i 桌面/wine-mono-9.3.0-x86.msi 

# 预留空行
echo >>  ~/.bashrc
# 将wine添加到PATH
echo 'export PATH=~/'${filename}'/bin:${PATH}' >> ~/.bashrc

# 立即加载修改
source ~/.bashrc
```

首先把cabextract安装，winetricks会依赖此工具。

```bash
sudo apt-get update
sudo apt-get install cabextract
# 可选，winetricks GUI 依赖。
sudo apt-get install zenity
```

> GoDaddy被认为自签证书：
>
> wget wrapper传参禁用验证；之后走缓存

```bash
# 更新wine环境
wineboot -u
# 安装字体，修复文字/密码/形状崩溃
winetricks fakechinese corefonts
# 安装d3d运行时，修复闪烁
winetricks d3dcompiler_47
# 安装 dotnet 运行时
winetricks dotnet6
# 强制使用软件渲染
wine reg add 'HKCU\Software\Microsoft\Avalon.Graphics' \
    /v DisableHWAcceleration \
    /t REG_DWORD \
    /d 1 \
    /f
# 设置系统伪装版本为 win11
winecfg -v win11
```

遗留问题：

## 主要：

画板中，输入经常会滑动到右小角

## 次要：

- 无法方便地切换课件 （点击范围小）
- 无法使用导入课件（同步正常）
- 视频播放较卡顿（DirectShow通病）
