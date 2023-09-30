# css手写三角形

### 1.实心三角形

实现步骤：

1. 准备有没有宽和高的盒子

2. 设置4个边框（可以设置不同的颜色看看效果）

3. 留下想要的三角形方向，其余边框设置transparent（透明）

实现代码：

```
     css代码
        <style>
            .box1{
                width: 0;
                height: 0;
                border-top: 50px solid pink;
                border-bottom:50px solid skyblue;
                border-left: 50px solid palegoldenrod;
                border-right: 50px solid greenyellow;
            }
        </style>

        html代码

        <body>
            <div class="box1"></div>
        </body>
```

效果图：

![](C:\Users\17227\AppData\Roaming\marktext\images\2023-09-11-23-30-01-1694446190890.png)

只保留图上粉色箭头

```
//border-top设置粉色，其余设置为透明
    <style>
            .box1
            {
                width: 0;
                height: 0;
                border-top: 50px solid pink;
                border-bottom:50px solid transparent;
                border-left: 50px solid transparent;
                border-right: 50px solid transparent;
            }
    </style>
```

```
// 简化css代码，把border(4个边都设置透明，只把想留下的border设置为有颜色的)
    <style>
            .box1
            {
                width: 0;
                height: 0;
                border: 50px solid transparent;
                border-top: 50px solid pink;
            }
    </style>
```

效果图
![](C:\Users\17227\AppData\Roaming\marktext\images\2023-09-11-23-32-50-1694446360003.png)

### 2.箭头三角形