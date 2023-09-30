#! /bin/bash
date="" #作者
author="小鱼" #作者
tag="[git,git报错]" #标签
category="git" #分类

for file in $(ls) 
do
file_type=${file#*.}
if [ $file_type == "md" ]
then
  title=${file%.*} #标题(% 截取左边字符；%.* 意指截取.左边所有字符，即把文件名截取出作为标题)
  #sed可以在指定行插入数据
  sed -i "1i \---" $file
  sed -i "2i title: $title" $file
  sed -i "3i author: $author" $file
  sed -i "4i tags: $tag" $file
  sed -i "5i category: $category" $file
  sed -i "6i date: $date" $file
  sed -i "7i \---" $file
else
echo "$file 不是md文件"
fi
done


