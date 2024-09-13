#!/usr/bin/bash

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
