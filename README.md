<div align="center">
<br>
<a href='https://gitee.com/touchscale/Qsign'><img src='https://gitee.com/touchscale/Qsign/widgets/widget_4.svg' alt='Fork me on Gitee'></img></a>
<h1>签名api一键包（Windows）
<img src='https://gitee.com/touchscale/Qsign/badge/star.svg?theme=dark'  alt='star'></img>
<img src='https://gitee.com/touchscale/Qsign/badge/fork.svg?theme=dark'  alt='fork'></img>
</h1>
</br>
</div> 

## 提醒
APi版本推荐使用1.1.9，1.2.1不推荐，原因:使用一段时间后有概率崩溃，导致签名APi异常

# 介绍
Windows的签名api一键搭建包

## 使用教程

1. [点击这里](https://share.weiyun.com/4nG2DbIn)或者[这里](https://cowtransfer.com/s/3c4534a336c04b)下载jdk软件（想使用其他版本可以打开 **jdk下载地址（32位系统或想用其他版本的可查看）.txt** 里的地址选择版本进行下载）
2. 克隆本仓库或在发行版中下载对应版本

使用 **gitee** 
```
git clone https://gitee.com/touchscale/Qsign
```
使用 **github** 
```
git clone https://github.com/touchscale/Qsign
```

3. 按照 **使用教程.txt** 里的教程完成搭建


## 疑难解答

1. 依赖安装或升级失败
- 可以试试先执行pnpm i，再执行依赖安装指令

2. Api连接超时
- 打开配置文件，将
```
"unidbg": {
    "kvm": false,
    "dynarmic": true,
    "unicorn": false,
    "debug": false
  },
```
更改为
```
"unidbg": {
    "kvm": true,
    "dynarmic": true,
    "unicorn": true,
    "debug": false
  },
```
后，重启api再试

## 配置文件说明

```
{ 
   "server": { 
     "host": "0.0.0.0", 
     "port": 8080 
   }, 
   "share_token": true, 
   // 共享token , 如果这个是false，且最大实例数量不是1，则一个号会拥有多个token 
   // token不会导致封号！！！！ 
   "count": 10, // 最大实例数量，如果没共享token，则为单个号最大实例数量 
   "key": "114514", // 请求密钥 
   "auto_register": true,  //自动注册实例
   "protocol": { 
     "package_name": "com.tencent.mobileqq", 
     "qua": "V1_AND_SQ_8.9.71_4332_YYB_D", 
     "version": "8.9.71", 
     "code": "4332" 
   }, 
   "unidbg": { 
     "dynarmic": false, // 高并发建议打开这个，但是实例数量不要太多，会爆炸, 10实例，内存会用掉5GB 
     "unicorn": true, // 追求稳定打开这个，内存占用小 
     "kvm": false, // 追求稳定打开这个，内存占用小 
     "debug": false   //日志等级
   }, 
   "black_list": [ 
     1008611 //  黑名单uin 
   ] 
 }
```

## 资源

* Miao-Yunzai（喵版Yunzai）:  [Gitee](https://gitee.com/yoimiya-kokomi/Miao-Yunzai) / [Github](https://github.com/yoimiya-kokomi/Miao-Yunzai)
* Yunzai-V3（喵喵维护版(使用 icqq)）：[Gitee](https://gitee.com/yoimiya-kokomi/Yunzai-Bot)
* miao-plugin（喵喵插件）: [Gitee](https://gitee.com/yoimiya-kokomi/miao-plugin) / [Github](https://github.com/yoimiya-kokomi/miao-plugin)
* Yunzai-Bot-plugins-index（插件库）：[Gitee](https://gitee.com/yhArcadia/Yunzai-Bot-plugins-index) / [GitHub](https://github.com/yhArcadia/Yunzai-Bot-plugins-index)
* unidbg-fetch-qsign（签名api项目地址）：[GitHub](https://github.com/fuqiuluo/unidbg-fetch-qsign)
* icqq（icqq项目地址）：[GitHub](https://github.com/icqqjs/icqq)

## 免责声明

功能仅限内部交流与小范围使用，请勿用于以盈利为目的的场景

<div align="center">

[![Wangsheng Funeral Parlor/签名api一键包（Windows）](https://gitee.com/touchscale/Qsign/widgets/widget_card.svg?colors=4183c4,ffffff,ffffff,e3e9ed,666666,9b9b9b)](https://gitee.com/touchscale/Qsign)
</div>

如果你喜欢这个项目，可以点点 Star，这是对开发者最大的动力