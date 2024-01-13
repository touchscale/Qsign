<div align="center">
<br>
<a href='https://gitee.com/touchscale/Qsign'><img src='https://gitee.com/touchscale/Qsign/widgets/widget_4.svg' alt='Fork me on Gitee'></img></a>
<h1>签名api一键包（Windows）
<img src='https://gitee.com/touchscale/Qsign/badge/star.svg?theme=dark'  alt='star'></img>
<img src='https://gitee.com/touchscale/Qsign/badge/fork.svg?theme=dark'  alt='fork'></img>

[![GitHub stars](https://img.shields.io/github/stars/touchscale/Qsign)](https://github.com/touchscale/Qsign/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/touchscale/Qsign)](https://github.com/touchscale/Qsign/network)
[![GitHub issues](https://img.shields.io/github/issues/touchscale/Qsign)](https://github.com/touchscale/Qsign/issues)
</h1>
</br>
</div> 

# [签名api原项目](https://github.com/fuqiuluo/unidbg-fetch-qsign)已经停止维护并删库，本项目仅更新QQ版本文件及教程！！！
# 因为部分[特殊原因](https://gitee.com/touchscale/Qsign/issues/I8G04Y?from=project-issue)，应要求删除NTQQ相关内容

# 介绍
## Windows的签名api一键搭建包

## 使用教程

#### Windows
1. [点击这里](https://share.weiyun.com/4nG2DbIn)或者[这里](https://cowtransfer.com/s/3c4534a336c04b)下载jdk软件（想使用其他版本可以打开 **jdk下载地址（32位系统或想用其他版本的可查看）.txt** 里的地址选择版本进行下载）
2. 克隆本仓库（不推荐，有时候最新的更新可能会有些问题，建议从发行版中下载）或在发行版中下载对应版本（推荐）

使用 **gitee** 
```
git clone https://gitee.com/touchscale/Qsign
```
使用 **github** 
```
git clone https://github.com/touchscale/Qsign
```

3. 按照 **使用教程.txt** 里的教程完成搭建

#### Linux 

1. 使用ssh工具连接服务器，如果是手机打开Termux即可

2. 安装jdk8


```
sudo apt update&&sudo apt install openjdk-8-jdk
```

3. 服务器使用ftp上传文件或者克隆项目，Termux直接克隆项目

4. 解压压缩包（克隆项目无需解压）


```
unzip Qsign-1.1.9.zip
```

5. 检查端口占用


```
netstat -lntp
```

注意：如有占用请编辑config.json，更改端口

6. 启动！


```
cd unidbg-fetch-qsign&&bash bin/unidbg-fetch-qsign --basePath=txlib/8.9.80
```

注意：版本号可更改

7. screen挂后台

①. 安装screen


```
sudo apt install screen
```

②. 创建窗口


```
screen -S qsign
```

③. 运行


```
cd unidbg-fetch-qsign&&bash bin/unidbg-fetch-qsign --basePath=txlib/8.9.80
```

注意：版本号可更改

④. Ctrl+a+d退出

8. 剩余步骤和**使用教程.txt**中的第2.3.5.6.7步一致

#### Docker

具体请看[教程](https://gitee.com/kissnavel/qsign-core#%E9%83%A8%E7%BD%B2%E6%96%B9%E5%BC%8F)，感谢作者[kissnavel](https://gitee.com/kissnavel)

### 疑难解答

1. 依赖安装或升级失败
- 可以试试先执行pnpm i，再执行依赖安装指令

2. Api连接超时
- 打开配置文件，将端口号更改一下(就是port: 801，801改为任意数字)，重启api再试

3. APi频繁崩溃
- 目前测试API使用8.9.83及以上QQ版本会出现这种情况，可以参考issues[#I8GLZN](https://gitee.com/touchscale/Qsign/issues/I8GLZN)进行解决（感谢[batvbs](https://gitee.com/batvbs)提供的解决方法），或者使用NTQQ

4. 报错内存错误并强制退出
- 目前API使用9.0.0及以上QQ版本会出现这种情况，暂无有效解决方法，可以使用低版本或者使用NTQQ

### 配置文件说明

```
{ 
   "server": { 
     "host": "0.0.0.0", // 监听地址
     "port": 8080 // 端口号
   }, 
   "key": "114514", // 请求密钥 
   "auto_register": true,  //自动注册实例
   "protocol": { 
     "package_name": "com.tencent.mobileqq", 
     "qua": "V1_AND_SQ_8.9.71_4332_YYB_D", 
     "version": "8.9.71", 
     "code": "4332" 
   }, // QQ版本信息
   "unidbg": { 
     "dynarmic": false, // 高并发建议打开这个，但是实例数量不要太多，会爆炸, 10实例，内存会用掉5GB 
     "unicorn": true, // 追求稳定打开这个，内存占用小 
     "debug": false   // 以日志等级debug显示日志
   }, 
   "black_list": [ 
     1008611 //  黑名单uin 
   ] 
 }
```

### 资源

* Miao-Yunzai（喵版Yunzai）:  [Gitee](https://gitee.com/yoimiya-kokomi/Miao-Yunzai) / [Github](https://github.com/yoimiya-kokomi/Miao-Yunzai)
* miao-plugin（喵喵插件）: [Gitee](https://gitee.com/yoimiya-kokomi/miao-plugin) / [Github](https://github.com/yoimiya-kokomi/miao-plugin)
* Yunzai-Bot-plugins-index（插件库）：[Gitee](https://gitee.com/yhArcadia/Yunzai-Bot-plugins-index) / [GitHub](https://github.com/yhArcadia/Yunzai-Bot-plugins-index)
* unidbg-fetch-qsign（签名api项目地址）：[GitHub](https://github.com/fuqiuluo/unidbg-fetch-qsign)
* icqq（icqq项目地址）：[GitHub](https://github.com/icqqjs/icqq)

### 免责声明

功能仅限内部交流与小范围使用，请勿用于以盈利为目的的场景

<div align="center">

[![Wangsheng Funeral Parlor/签名api一键包（Windows）](https://gitee.com/touchscale/Qsign/widgets/widget_card.svg?colors=4183c4,ffffff,ffffff,e3e9ed,666666,9b9b9b)](https://gitee.com/touchscale/Qsign)
</div>

如果你喜欢这个项目，可以点点 Star，这是对开发者最大的动力
