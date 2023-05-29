# 查看修改用户信息等命令

1. 查看git配置命令``` git config```

2. config 配置有system级别 global（用户级别） 和local（当前仓库）三个， 设置先从system->global->local  底层配置会覆盖顶层配置；
   
   - 查看系统config``` git config --system --list ```
   
   - 查看当前用户（global）配置 ```git config --global  --list```
   
   - 查看当前仓库配置信息 `git config --``local`  `--list`

3. 查看用户信息：
   
   - 查看用户名：git config user.name
   
   - 查看密码：git config user.password
   
   - 查看邮箱：git config user.email

4. 修改用户信息
   
   - 修改用户名：git config --global user.name 用户名（lm）
   
   - 修改密码：git config --global user.password 密码(123456)
   
   - 修改邮箱：git config --global user.email 邮箱（123@qq.com）
