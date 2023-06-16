# css 的新特性

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-03-15-14-01-image.png)

### 2.4伪元素选择器（重点）

伪元素选择器可以帮助我们利用css创建新标签与那苏，而不需要html标签，简化html结构

1. ::before   从元素内部的前面插入内容

2. ::after   从元素内部的后面插入内容

注意：

- **before**和**after**创建一个元素，但是属于行内元素

- 新创建的这个元素在文档书是找不到的，所以我们称为**伪元素**

- **语法：element:before{}**

- before和after必须有**content属性**

- before在父元素内容的前面创建元素，after在元素内容后面插入元素

- **伪元素**和**标签选择器**的一样，权重为1

#### 伪元素清除浮动

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-03-15-57-25-image.png)

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-03-15-57-47-image.png)

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-03-15-59-38-image.png)

### 2.5盒子模型

css3中可以通过**box-sizing**来指定和模型，有2个值，即可指定为**content-box、border-box**，这样我们计算盒子大小的方式发生了改变

可以分成两种情况：

1. box-sizing：content-box 盒子大小为width+padding+border（以前默认的）

2. box-sizing：border-box  盒子大小为width （前提padding和border不会超过宽度）

### 2.6CSS3其它特性（了解）

##### 1.css3滤镜fileter:

filter css属性姜末或颜色偏移等图形效果应用于元素

```
filter:函数（）；filter:blur(5px); blur模糊处理 数值越大越模糊
```

##### 2.css3 calc函数

calc()此css函数让你在声明css属性值是执行一些计算

```
width:calc(100% - 80px)；
```

括号可以通过使用+ - * / 来进行计算

### 2.7css3过渡（重点）

过渡动画：是从一个状态渐渐过渡到另外一个状态

场合：hover属性配合使用

```
transition:要过度的属性 花费时间 运动曲线 何时开始
```

 ![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-03-23-15-28-image.png)
