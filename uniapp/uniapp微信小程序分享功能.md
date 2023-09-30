# uniapp 分享好友、群、朋友圈、生成海报

### 1.分享好友、群、朋友圈

1. 分享好友和朋友圈会用 onShareAppMessage 、onShareTimeline 两个函数，这两个函数是和onLoad同级
   
   ```
   export default {
   data() {
     return {
         // 默认的全局分享内容
         share: {
             title: '分享标题',
             path: '/pages/index',    // 全局分享的路径
             imageUrl: '分享后显示的封面路径',    // 全局分享的图片(可本地可网络)
         }
     }
   },
   // 定义全局分享
   // 1.发送给朋友
   onShareAppMessage(res) {
     return {
         title: this.share.title,
         path: this.share.path,
         imageUrl: this.share.imageUrl,
     }
   },
   //2.分享到朋友圈
   onShareTimeline(res) {
     return {
         title: this.share.title,
         path: this.share.path,
         imageUrl: this.share.imageUrl,
     }
   },
   }
   ```

2. 单独把这个函数写在一个文件通过mixins混入

3. 页面使用分享
   
   - 全局混入(main.js)
     
     ```
     import share from './pages/share/index.js'
     import Vue from 'vue'
     Vue.mixin(share)
     ```
   
   - 单页面混入
     
     ```
     import share from '../share/index.js'
     export default {
     mixins: [share],
     }
     ```
   4. 注意点：
      - 自己页面有分享好友功能：需要使用```<button open-type="share"></button>```代码，可把这个按钮改成透明，覆盖到自定义的分享按钮
      - 微信朋友圈只能通过右上交分享（2023-09记录）
      - 参考链接：

### 2.生成海报（使用canvas）| 海报背景图+小程序码

1. 从后端接口获取accessToken

2. 去微信接口生成小程序（这里返回的是二进制数据）

3. 把图片数据转成base64图片

4. canvas无法直接绘制base64图片，需要下载临时图片（uni.getFileSystemManager），使用后再删除

5. 使用canvas绘制海报

6. 下载海报 uni.canvasToTempFilePath
   
   ```
            // 获取程序码
            getQrcode() {
                <!-- 从后端获取 accessToken -->
                    this.accessToken = res.data.result;
                    <!-- 生成小程序码 -->
                    uni.request({
                        url: 'https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=' + this
                            .accessToken, //url地址
                        method: 'POST',
                        data: {
                            scene: 'userid=1',//自定义小程序码中的参数
                            page: 'pages/index' //生成页面地址
                        },
                        responseType: 'arraybuffer',
                        arrayBuffer: true,
                        header: {
                            'Content-Type': 'application/json',
                            'Y-Token': this.globalData.token,
                        },
                        success: res => {
                            <!-- 获取的小程序码是二进制，转成base64图片 -->
                            const arrayBuffer = new Uint8Array(res.data)
                            const base64 = "data:image/png;base64," + uni.arrayBufferToBase64(arrayBuffer) //这里需要添加前缀
   
                            this.base64ToSave(base64).then((res) => {
                                this.canvasPoster(res)
                            })
   
                        }
                    })
   
            },
            // 绘制海报
            canvasPoster(img) {
                let _this = this;
                <!-- 获取系统信息，这里主要想要获取可使用窗口宽度和高度 -->
                uni.getSystemInfo({
                    success: function(res) {
                        _this.uploadWidth = res.windowWidth
                        _this.uploadheight = res.windowHeight
                    }
                });
   
                const poster = uni.createCanvasContext('poster')
                <!-- 绘制海报背景图片 -->
                poster.drawImage('我这里放的是海报背景图', 0, 0, _this.uploadWidth, _this.uploadheight)
                <!-- 这里绘制小程序码-->
                <!-- 小程序码垂直居中：_this.uploadWidth（窗口可使用宽度） / 2 - 40（小程序码宽度一半） -->
                <!-- 小程序码距离窗口底部155: _this.uploadheight（窗口可使用搞度） - 155 -->
                poster.drawImage(img, _this.uploadWidth / 2 - 40, _this.uploadheight - 155 , 80, 80)
                poster.draw()
            },
            // 保存base64图片
            base64ToSave(base64data, FILE_BASE_NAME = 'tmp_base64src') {
                const fsm = uni.getFileSystemManager();
                return new Promise([]()sync (resolve, reject) => {
                    //format这个跟base64数据的开头对应
                    const [, format, bodyData] = /data:image\/(\w+);base64,(.*)/.exec(base64data) || [];
                    if (!format) {
                        reject(new Error('ERROR_BASE64SRC_PARSE'));
                    }
                     await this.removeSave(FILE_BASE_NAME, format);
                    const filePath = `${wx.env.USER_DATA_PATH}/${FILE_BASE_NAME}.${format}`;
                    fsm.writeFile({
                        filePath,
                        data: bodyData,
                        encoding: 'base64',
                        success() {
                            resolve(filePath);
                        },
                        fail() {
                            reject(new Error('ERROR_BASE64SRC_WRITE'));
                        },
                    });
                });
            },
            removeSave(FILE_BASE_NAME = 'tmp_base64src', format = 'jpg') {
                return new Promise((resolve) => {
                    // 把文件删除后再写进，防止超过最大范围而无法写入
                    const fsm = uni.getFileSystemManager(); //文件管理器
                    const FILE_BASE_NAME = 'tmp_base64src';
                    const filePath = `${wx.env.USER_DATA_PATH}/${FILE_BASE_NAME}.${format}`;
                    fsm.unlink({
                        filePath: filePath,
                        success(res) {
                            console.log('文件删除成功');
                            resolve(true);
                        },
                        fail(e) {
                            console.log('readdir文件删除失败：', e);
                            resolve(true);
                        }
                    });
                })
            },
            // 下载海报
            downloadPoster() {
                uni.canvasToTempFilePath({
                    x: 0,
                    y: 0,
                    width: this.uploadWidth,
                    height: this.uploadheight,
                    canvasId: 'poster',
                    success: function(res) {
                        // 保存图片到本地
                        uni.saveImageToPhotosAlbum({
                            filePath: res.tempFilePath,
                            success: function() {
                                uni.showToast({
                                    title: "保存成功",
                                    icon: "none"
                                });
                            },
                            fail: function() {
                                uni.showToast({
                                    title: "保存失败，请稍后重试",
                                    icon: "none"
                                });
                            }
                        })
                    }
                })
            }
   ```