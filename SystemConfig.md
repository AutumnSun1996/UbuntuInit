# 系统个性化设置
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
+ 自行下载背景图片

+ 修改文件：/usr/share/gnome-background-properties/xenial-wallpapers.xml， 在`<wallpapers>`中添加
```
 <wallpaper deleted="false">
   <name>[name]</name>
   <filename>[xml_path]</filename>
   <options>zoom</options>
 </wallpaper>
 ```
`[xml_path]`需要与python脚本一致
+ 使用[python脚本](wallpaper.py)生成xml文件


## 配置系统快捷键
+ 打开`系统设置 -> 键盘 -> 快捷键`
+ 修改或取消`系统 -> 锁定屏幕`（与IDEA 自动格式化 快捷键冲突，一般改为Ctrl+Super+L）
+ 新建快捷键`nautilus`，打开文件浏览器

## 显示设置
+ 打开`系统设置 -> 时间和日期 -> 时钟`， 配置菜单栏时钟样式

