#!/usr/bin/bash

filename="wine-9.17-amd64-wow64"
# 解压wine
tar xf res/${filename}.tar.xz -C ~
# 解压 winetricks 下载缓存
tar xf res/winetricks-cache.tar.gz -C ~
# 拖入 winetricks 脚本备用
cp res/winetricks ~/${filename}/bin
# 为 winetricks 设置可执行权限
chmod +x ~/${filename}/bin/winetricks

# 预留空行
echo >>  ~/.bashrc
# 将wine添加到PATH
echo 'export PATH=~/'${filename}'/bin:${PATH}' >> ~/.bashrc
