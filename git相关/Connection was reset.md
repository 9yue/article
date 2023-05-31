# git  Connection was reset

1. 在git中执行git config --global --unset http.proxy和git config --global --unset https.proxy
   
   ```
   git config --global --unset http.proxy
   git config --global --unset https.proxy
   ```

2. 在cmd下执行ipconfig/flushdns 清理DNS缓存
   
   ```
   ipconfig/flushdns
   ```

3. 重新拉取、提交、推送
