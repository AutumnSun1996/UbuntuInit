#!/bin/bash

#可用文件后缀名列表
readonly prefixs=("jpg" "jpeg" "png" "bmp")

#动态背景文件地址
# entry is in "/usr/share/gnome-background-properties/xenial-wallpapers.xml"
readonly animate_background_file_path="[xml_path]"
 
#文件列表索引
index=0

#获取图像文件列表
get_image_files(){
    
    #获取文件所在目录名称
    base_dir="`dirname $1`/`basename $1`"
    
    for f in $base_dir/*
    do    
        #检查文件后缀
	sufix=${f##*.}
        for p in "${prefixs[@]}"
        do
	    #后缀名称符合条件
	    if [ sufix=p ]
	    then
		file_list[$index]="$f"
		echo "获取图像：$f"
		let index=$index+1
		break
	    fi
        done
            
    done

}
 

#写入文件
replace_file(){

    #创建临时文件
    animate_back="animate_back.xml"
    #清空文本内容
    cat /dev/null > $animate_back
    
    echo -e  "<background>" >> $animate_back
    echo -e  "\t<starttime>" >> $animate_back
    echo -e  "\t\t<year>$(date +%Y)</year>" >> $animate_back
    echo -e  "\t\t<month>$(date +%m)</month>" >> $animate_back
    echo -e  "\t\t<day>$(date +%d)</day>" >> $animate_back
    echo -e  "\t\t<hour>00</hour>" >> $animate_back
    echo -e  "\t\t<minute>00</minute>" >> $animate_back
    echo -e  "\t\t<second>00</second>" >> $animate_back
    echo -e  "\t</starttime>" >> $animate_back

    #写入文件名称
    index_=0
    len=${#file_list[@]}
    for f in "${file_list[@]}"
    do    
        if [ $index_ -eq $((len-1)) ]
        then
            fn=${file_list[0]}
        else
            fn=${file_list[$index_+1]}
        fi

        echo -e  "\t<static>" >> $animate_back
        echo -e  "\t\t<duration>${STAY:=300}</duration>" >> $animate_back
        echo -e  "\t\t<file>$f</file>" >> $animate_back
        echo -e  "\t</static>" >> $animate_back        
        echo -e  "\t<transition>" >> $animate_back
        echo -e  "\t\t<duration>${DURATION:=3}</duration>" >> $animate_back
        echo -e  "\t\t<from>$f</from>" >> $animate_back
        echo -e  "\t\t<to>$fn</to>" >> $animate_back
        echo -e  "\t</transition>" >> $animate_back
        
        let index_=$index_+1
    done
        
    echo -e  "</background>" >> $animate_back
    
    #移动文件
    mv $animate_back $animate_background_file_path
    if [ $? -eq 0 ]        
    then 
        echo -e  "已经设定好文件"
    fi

}

help(){
    echo
    echo "命令格式：`basename $0` [OPTION] -f Filepath"
    echo "指定图片目录，目录下的图片将作为动态更换的壁纸"
    echo
    echo -e "-f[Filepath]\t 图像文件目录"
    echo -e "-d[Duration]\t 图像切换时长，默认3s"
    echo -e "-s[StayTime]\t 图像停留时长，默认300s"
    echo
    exit 1
}


#处理参数
while getopts f:s:d: OPTION
do
    case "$OPTION" in
    f)
        FILE_PATH="$OPTARG"
        ;;
    s)
        STAY="$OPTARG"
        ;;
    d)
        DURATION="$OPTARG"
        ;;
    *)
        help
        ;;
    esac
done

if [ -z "$FILE_PATH" ]
then  
    help    
fi


 
#判断目录是是否存在
if [ -d $FILE_PATH ]
then     
    #获取到文件列表
    get_image_files $FILE_PATH
    
    #获取文件数目
    file_count=${#file_list[@]}
    
    if [ $file_count -gt 0 ]        
    then
        #替换原有动态背景文件
        echo "共获取到$file_count个图像文件"
        replace_file     
    else
        echo "目录$FILE_PATH下不存在符合要求的图像文件：${prefixs[*]}"
    fi
    

else
    echo "不存在目录：$FILE_PATH"            
fi                     
 

exit 0
