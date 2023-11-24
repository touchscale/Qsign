@echo 如果运行后乱码，请右键编辑脚本 另存为 编码选ANSI 保存
@echo off
title API请勿关闭
echo API已启动，日志输出log.txt
rem 劫持控制台输出到文件，1为正常消息，2为错误消息，34为缓冲区
rem 使用findstr命令筛选需要的日志消息
>>log.txt 2>&1 3>&1 4>&1 echo %date%-%time%

bin\unidbg-fetch-qsign --basePath=txlib\8.9.85|findstr "警告:"
rem 可自行修改需要登录的QQ版本

exit


