# css 用户界面样式

### 1. 鼠标样式 cursor

```
li { cursor:pointer;}
```

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-05-31-18-10-17-1685527813870.png)

### 2. 轮廓线 outline

给表单添加outline:0;或outline:none

```
input {outline:none;}
```

### 3. 防止拖拽文本域 resize

```
textarea {resize:none;}
```

#### 4.  vertical-align 属性应用

使用场景:经常用于设置图片或者表单（行内块元素）和文字垂直对齐

官方解释：用于设置一个元素的**垂直对齐方式**，但是它只针对于行内元素或者行内块元素有效

```
vertical-align:baseline | top | middle | bottom
```

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-05-31-18-28-11-1685528886740.png)

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-05-31-18-29-28-1685528949901.png)

### 5.解决图片底部默认空白缝隙问题

bug：图片底侧出现一个空白风险，原因是行内块元素会和文字基线对齐

主要两种解决办法：

1. 给图片添加**vertical-align:middle | top | bottom**等。（提倡使用）

2. 把图片转换为块级元素 **display:block；**

### 6. 溢出的文字省略号显示

##### 6.1 单行文本一处显示省略号--必须满足三个条件

```
      /* 1.先强制一行内显示 */
      white-space: nowrap;
      /* 2.超出的部分隐藏 */
      overflow: hidden;
      /* 3.文字溢出的时候用省略号显示 */
      text-overflow: ellipsis;
```

##### 6.2 多行文本溢出问题显示省略号

多行文本溢出显示省略号，有较大兼容性问题，适合于webKit浏览器或者移动端（移动端大部分是webkit内核）

```
  overflow: hidden;
  text-overflow: ellipsis;
  /* 弹性伸缩盒子模型显示 */
  display: -webkit-box;
   /* 限制在一个块元素显示的行数 */
   webkit-line-clamp: 2;
   /* 设置和检索伸缩盒对象的子元素排列方式  vertical 垂直居中*/
   webkit-box-orient: vertical;
```

更推荐后台人员实现

### 7. 常见布局技巧

##### 1.1 css 三角强化

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-05-31-23-19-37-image.png)

原理：一个直角三角形盖住矩形

如何画出直角三角形：

1. 盒子高度宽度设置为0

2. 盒子边框的左边下边宽度为0

3. 盒子上边框高度大一些（示例：100px），右边框设置小一些（示例:50px）和盖住矩形的颜色

代码

```
width:0;
height:0;
/* 1.只保留有边框有颜色 */
border-color:transparent red transparent transparent;
/* 2.样式兜售solid */
border-style:solid;
/* 3.上边框宽度更大,右边宽宽度更小,其余边框是 0*/
border-width:100px 50px 0 0;
```

### 8. css 初始化

css初始化时值重设浏览器样式。（也成为 CSS reset）

每个网页都必须首先进行CSS初始化

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-05-31-23-51-57-1685548310774.png)
