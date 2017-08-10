# 安装机器学习相关工具
## 安装pip及Python库
```
sudo apt-get install python3-pip
pip3 install -U pip
pip3 install --user scikit-learn scikit-optimize jupyter catboost
```


## 安装LightGBM
+ 安装GPU加速需要的依赖
```
sudo apt-get install ocl-icd-libopencl1 ocl-icd-opencl-dev libboost-dev libboost-system-dev libboost-filesystem-dev
```
+ 安装LightGBM
```
cd ~
mkdir Projects
cd Projects
git clone --recursive https://github.com/Microsoft/LightGBM
cd LightGBM
mkdir build ; cd build
cmake -DUSE_GPU=1 .. 
make -j4 
```
+ 安装python库
```
cd ~/Projects/LightGBM/python-package
pip3 install --user -e .
```


## 安装XGBoost
+ 安装XGBoost
```
cd ~
mkdir Projects
cd Projects
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost
make -j4
```
+ 安装python库
```
cd ~/Projects/xgboost/python-package
pip3 install --user -e .
```

## 安装MongoDB
+ 下载并安装MongoDB
参考[官网说明](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb-community-edition)
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
# below line is for 16.04
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
```
+ 添加用户
```
mongo

use admin
db.createUser(
    {
        user: "[UserName]",
        pwd: "[PassWord]",
        roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
    }
)

```
+ 修改配置
配置文件为`/etc/mongod.conf`
修改参见[官方文档](https://docs.mongodb.com/manual/reference/configuration-options/)
```
# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0

#security:
security:
  authorization: enabled
```
修改后运行`sudo service mongod restart`

## 安装RabbitMQ
+ 下载并安装RabbitMQ
参考[官网说明](https://www.rabbitmq.com/install-debian.html)
```
# add the APT repository 
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
# (optional) add public key to trusted key list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get install rabbitmq-server
sudo service rabbitmq-server start
```

+ 添加用户
```
sudo rabbitmqctl add_user [user] [password]
sudo rabbitmqctl set_user_tags [user] administrator
sudo rabbitmqctl set_permissions -p / [user] ".*" ".*" ".*"
sudo service rabbitmq-server restart
```
