@rem 如果运行后乱码，请右键编辑脚本 另存为 编码选ANSI 保存
@echo off
@fsutil dirty query "%systemdrive%" 1>nul 2>nul || (mshta vbscript:CreateObject^("Shell.Application"^).ShellExecute^("""cmd.exe""","/c %~s0",,"runas",1^)^(window.close^)&&exit)
@fsutil dirty query "%systemdrive%" 1>nul 2>nul || (echo 请右键“以管理员身份运行”&timeout /t 7&exit)
set r=0
set te=8640000
set err=正常启动
cd /d %~dp0


set apipath=".\unidbg-fetch-qsign"
cd /d %apipath%
rem 请设置api安装路径。本脚本可放在任何位置，以适配任何第三方启动器
rem （一闪启动器删掉这四行，改名start.bat，和api.bat均放在API目录即可）


set yunzaipath="..\Miao-Yunzai"
set yunzai=node app
set yunzainame=Miao-Yunzai
rem 请设置喵崽的安装路径、启动方式、窗口标题前缀
if not exist %yunzaipath% echo 警告：找不到喵崽安装路径，右键编辑脚本即可配置



:auto
call :api
title 监控-API已重启%r%次
set /a r+=1
rem 启动 签名API 并记录日志



:log
rem 间隔30秒小循环一次
timeout /t 30 >nul

:api_st
rem 检测API是否还在运行
for /f "tokens=2 delims=," %%a in ('tasklist /v /fo csv^|find "API请勿关闭"') do (
  goto api_log_st
)
set err=API闪退。重启API。
goto bug

:api_log_st
rem 检测日志是否有报错
for /f "delims=" %%a in ('findstr "警告: emulate RX@" log.txt') do (
  set err=日志报错。重启API。
  goto bug
)
goto log



:bug
rem 判断运行时间是否大于600秒
call :time %time1% %time%
if %te% GTR 60000 (
    rem API异常，已重启
    call :off API请勿关闭
) else (
    rem API频繁异常，重启喵崽
    set err=%err%重启喵崽。
    call :off API请勿关闭
    call :off %yunzainame%
    taskkill /f /t /im node.exe
    timeout /t 20 >nul
    call :miao
)
rem 跳转到auto 大循环重启api
goto :auto





rem 启动 签名API，记录并展示启动时间
:api
call :off API请勿关闭
if exist log.txt del /f /q log.txt >nul
del /f /q hs_err_pid* >nul 2>nul
rem 删除日志
set time1=%time%
echo %date%-%time%-%err%
echo.
echo.
>>logs.txt echo %date%-%time%-%err%
start api.bat
exit /b



rem 结束 指定程序
:off
for /f "tokens=2 delims=," %%a in ('tasklist /v /fo csv^|find "%1"') do (
  taskkill /pid %%~a
)
timeout /t 3 >nul
exit /b



rem 延迟6秒启动喵崽
:miao
PUSHD %yunzaipath%
start cmd /c "timeout /t 6 & %yunzai%"
POPD
exit /b



rem 计算时间差，单位为毫秒
rem 输入 call :time 时间1 时间2
rem 输出 %te%
:time
@set ta=%1
@set tb=%2
@if %ta:~1,1%==: @set ta=0%ta%
@if %tb:~1,1%==: @set tb=0%tb%
@set /a tc=1%ta:~0,2%*360000+1%ta:~3,2%*6000+1%ta:~6,2%*100+1%ta:~9,2%-36610100
@set /a td=1%tb:~0,2%*360000+1%tb:~3,2%*6000+1%tb:~6,2%*100+1%tb:~9,2%-36610100
@set /a te=td-tc
@if %te:~,1%==- @set /a te+=8640000
@exit /b
