# 配置开发环境
## 安装常用工具
```
sudo apt-get install curl cmake
```

## 安装ssh
```
sudo apt-get install openssh-server
service ssh start
sudo systemctl enable ssh
```

## 安装git
```
sudo apt-get install git
git config --global user.email "q19960105@163.com"
git config --global user.name "AutumnSun1996"
git config --global push.default simple
git config credential.helper store 
# 在~/.git-credentials中明文保存密码，一直有效
git config --global credential.helper 'cache --timeout=3600'
# 在~/.git-credentials中明文保存密码，有效时间3600sec
```

## 安装IDEA
+ 下载[IDEA](https://www.jetbrains.com/idea/download/#section=linux)

+ 解压到~/Software, 运行 bin/idea.sh

+ License Server: http://idea.iteblog.com/key.php

+ 可选：从[jar文件](settings.jar)导入配置。

