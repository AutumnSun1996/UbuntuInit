# 安装机器学习相关工具
## 安装Python工具
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

