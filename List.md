## 安装常用工具
```
sudo apt-get install git curl cmake
```

## 配置git
```
git config --global user.email "q19960105@163.com"
git config --global user.name "AutumnSun1996"
```


## 安装ssh
```
sudo apt-get install openssh-server
service ssh start
sudo systemctl enable ssh
```


## 设置透明窗口
```
sudo apt-get install compizconfig-settings-manager compiz-plugins
```
+ 打开ccsm，启用`不透明度、亮度与饱和度`

+ 配置过滤项：
```
Normal | Dialog | ModalDialog | Toolbar | Fullscreen | Tooltip | Menu | PopupMenu | DropdownMenu
```

## 设置动态切换背景
+ 自行下载背景

+ 修改文件：/usr/share/gnome-background-properties/xenial-wallpapers.xml， 在`<wallpapers>`中添加
```
 <wallpaper deleted="false">
   <name>[name]</name>
   <filename>[xml_path]</filename>
   <options>zoom</options>
 </wallpaper>
 ```
`[xml_path]`需要与bash脚本一致
+ 使用bash脚本生成xml文件


## 安装Python工具
```
sudo apt-get install python3-pip
pip3 install -U pip
pip3 install --user scikit-learn scikit-optimize jupyter catboost
```

## 安装IDEA
+ 下载[IDEA](https://www.jetbrains.com/idea/download/#section=linux)

+ 解压到~/Software, 运行 bin/idea.sh

+ License Server: http://idea.iteblog.com/key.php

+ 插件：Python，NodeJS

+ 可选：从jar文件导入配置。


## 安装LightGBM
+ 安装GPU加速需要的依赖
```
sudo apt-get install ocl-icd-libopencl1 ocl-icd-opencl-dev libboost-dev libboost-system-dev libboost-filesystem-dev
```
+ 安装LightGBM
```
git clone --recursive https://github.com/Microsoft/LightGBM
cd LightGBM
mkdir build ; cd build
cmake -DUSE_GPU=1 .. 
make -j4 
```
+ 安装python库
```
cd ../python-package
pip3 install --user -e .
```


## 安装XGBoost
+ 安装XGBoost
```
cd ~/Projects
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost
make -j4
```
+ 安装python库
```
cd python-package
pip3 install --user -e .
```

## 安装TeamViewer
+ 下载[deb文件](https://www.teamviewer.com/en/download/linux/)安装


## 安装Synergy
+ 下载[deb文件](https://sourceforge.net/projects/synergy-stable-builds/files/?source=navbar)安装


## 安装LaTeX
```
sudo apt-get install texlive-full
```
+ IDEA安装插件: TeXiFy IDEA
