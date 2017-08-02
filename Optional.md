# 其他可能需要的配置
## 设置自动挂载
+ 查看硬盘挂载信息。
```
sudo blkid
```
+ 找到需要挂载的分区的UUID
```
sudo gedit /etc/fstab
```
+ 添加：
```
UUID=[UUID] [挂载点] [文件系统] defaults 0 2
```
+ 可以使用`sudo mount -a`测试
