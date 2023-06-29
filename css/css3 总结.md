# css3 总结

### 1.新的选择器

1. 属性选择器
   
   - [title]
   
   - [class="demo"]

2. 结构伪类选择器
   
   - nth-child(n)
     
     - n-数字，选择第几个
     
     - 关键词，even 偶数 odd 奇数
     
     - 公式，2n(偶数) 2n+1（奇数）4n...
   
   - nth-of-tyoe（n） 根据类型去选择

3. 伪元素选择器
   
   - ::before
   
   - ::after

### 2.转换 transform

1. 2D转换
   
   - translate（x,y）
   
   - rotate(45deg)
   
   - scale(x,y)

2. 3D转换
   
   - translate3d(x,y,z)
   
   - rotateX(x)
   
   - rotateY(y)
   
   - rotateZ(z)

### 3.动画 animation

重点记住动画简写属性

### 4.浏览器私有前缀

1. -moz-：代表firefox浏览器私有属性

2. -ms-：代表ie浏览器私有属性

3. -webkit：代表safari，chrome浏览器私有属性

4. -o-：代表Opera浏览器私有属性
