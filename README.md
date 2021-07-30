### 1.1 说明
为了方便下载jable
`jable-chrome-extensions`是chrome 插件

`jable-chrome-extensions-cmd` 是依赖程序，借用了 [N_m3u8DL-CLI](https://github.com/nilaoda/N_m3u8DL-CLI)实现下载`m3u8`，合并成 `mp4`功能

#### 1.2 流程
`注册一个协议` --> `chrome插件生成一个下载链接` --> `点击链接执行 run.bat` --> `调用N_m3u8DL-CLI开始下载`


### 2.0 安装 

`chrome` 地址栏输入：chrome://extensions/

把`jable-chrome-extensions`整个文件拖进去就完成安装

`jable-chrome-extensions-cmd`是依赖程序

右击 `init.bat`,以管理员身份运行，向注册表添加一个协议注册

### 3.0 使用
chrome 打开 https://jable.tv/videos/xx/ 播放页面

点击标题后面 `[下载]`,调用下载程序，

现版本默认下载到 `C:\Users\Public\Downloads`,
可通过修改`init.bat`文件中的`savepath`参数，更换默认下载地址

