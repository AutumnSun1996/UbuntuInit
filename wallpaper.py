#!/bin/python3
import os
from datetime import datetime
import random

# 指定用作背景的图片目录，不会查找子目录
image_dirs = ['.']

# 指定生成的xml文件路径
xml_path = './wallpaper.xml'

# 图片持续的时间，单位为秒
static_time = 300

# 切换图片时的动画时间，单位为秒
trans_time = 3

# shuffle>0时将随机抽取图片，
# 抽取的次数为int(len(files) * shuffle)
shuffle = 3

# 视作图片的文件后缀
suffix = ('.jpg', '.jpeg', '.png', '.bmp')

# 以上为配置项

###############################################################################

# 根据目录获取背景图片
images = []
for image_dir in image_dirs:
    for name in os.listdir(image_dir):
        if name.endswith(suffix):
            path = os.path.join(image_dir, name)
            print('Get', path)
            images.append(os.path.realpath(path))

print('Get', len(images), 'Images')

# 随机获取图片
if shuffle > 0:
    files = images
    images = []
    for i in range(int(len(files) * shuffle)):
        images.append(random.choice(files))
    print('Shuffled To', len(images), 'Wallpapers')

# XML模板
full_xml = """
<background>
    <starttime>
        <year>{now.year}</year>
        <month>{now.month}</month>
        <day>{now.day}</day>
        <hour>00</hour>
        <minute>00</minute>
        <second>00</second>
    </starttime>
{data}
</background>
""".strip('\n')
item = """
    <static>
        <duration>{static_time}</duration>
        <file>{current}</file>
    </static>
    <transition>
        <duration>{trans_time}</duration>
        <from>{current}</from>
        <to>{next}</to>
    </transition>
""".strip('\n')

# 生成XML内容
data = []
for idx in range(len(images) - 1):
    data.append(item.format(current=images[idx], next=images[idx + 1], static_time=static_time, trans_time=trans_time))
data.append(item.format(current=images[-1], next=images[0], static_time=static_time, trans_time=trans_time))

# 写入XML文件
with open(xml_path, 'w', -1, 'utf-8') as xml:
    xml.write(full_xml.format(now=datetime.now(), data='\n'.join(data)))
print('Writed to', xml_path)
