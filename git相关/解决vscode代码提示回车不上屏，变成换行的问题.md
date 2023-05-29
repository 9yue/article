## 解决vscode代码提示回车不上屏，变成换行的问题

1. 左下角的设置选择 命令面板

2. 输入： `键盘` ，如下图所示， 选择 `打开键盘快捷方式(JSON)` ，

3. 在keybindings.json中添加如下内容
   
   ```
   ,
   { 	
       "command": "acceptSelectedSuggestion",
       "key": "enter",
       "when": "editorTextFocus && suggestWidgetVisible" 
   }
   
   
   ```



4. 参考链接[ 解决 Visual Studio Code 代码提示 回车不上屏，变成换行的问题](https://blog.csdn.net/xiaojin21cen/article/details/103541036))


