# flex布局

## 父项常见属性

- flex-direction：设置主轴的方向

- justify-content:设置主轴上的子元素排列方式

- flex-wrap：设置子元素是否换行

- align-content：设置侧轴上的子元素排列方式（多行）

- align-items：设置侧轴上的子元素排列方式（单行）

- flext-flow：复合属性，相当于同时设置了flex-direction和flew-wrap

### flex-direction设置主轴的方向

#### 1.主轴与侧轴

在flex布局中，分为主轴与侧轴两个方向，同样的叫法有：行和列，x轴和y轴

- <mark>默认主轴方向就是x轴方向，水平向右</mark>

- <mark>默认侧轴方向就是y轴方向，水平向下</mark>

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-23-21-44-18-image.png)

#### 2.属性值

flex-direction属性决定主轴的方向（即项目排列方向）

<mark>注意：主轴和侧轴时会变化的，就是看flex-direction设置谁为主轴。</mark>剩下的就是侧轴。而我们的子元素是跟着主轴排列的

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-23-21-48-26-image.png)

### justify-content设置主轴上的子元素排列方式

justify-content属性定了项目在主轴上的对齐方式

<mark>注意：使用这个属性之前一定要确定好主轴是哪个</mark>

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-23-21-57-38-image.png)

### flex-wrap设置子元素是否换行

flex布局中默认是不换行，项目都排在一条线上（又称“轴线”）。

### align-items 设置侧轴上的子元素排列（单行）

该属性设置子项在侧轴（默认y轴）的排列方式，在子项为（单项）的时候使用

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-27-17-02-46-image.png)

### align-content 设置侧轴上的子元素排列（多行）

该属性设置子项在侧轴的排列方式并且只能用于子项出现**换行**的情况（多行），在单行下是没有效果的。

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-06-27-17-15-07-image.png)

总结：单行找align-item 多行找align-content

### flex-flow

flex-flow 属性是flex-direction和flex-wrap属性的复合属性

## 子项常见属性

- flex子项目站的分数（重要）

- align-self 控制子项自己在侧轴的排列方式

- order属性定义子项的排列顺序（前后顺序）

### flex属性

flex属性定义子项目分配**剩余空间**，用flex来表示占多少**份数**

```
.item {
    flex:<number>/*default 0 */
}
```

### order 定义项目的排列顺序

数值越小，排列越靠前，默认为0

注意：和z-index不一样
