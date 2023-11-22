@ echo off
cd unidbg-fetch-qsign
set te=8640000
set yunzaipath="..\Yunzai-Bot"
set yunzai=node app
set yunzainame=Miao-Yunzai
rem 请设置云崽的安装路径、启动方式、窗口标题前缀

rem 如果运行后乱码，请右键编辑脚本 另存为 编码选ANSI 保存

:auto
call :api
timeout /t 3 >nul
rem 启动 签名API 并记录日志

:log
rem 间隔30秒小循环一次
timeout /t 30 >nul
:api_st
rem 检测API是否还在运行
for /f "tokens=2 delims=," %%a in ('tasklist /v /fo csv^|find "API请勿关闭"') do (
  goto api_log_st
)
goto bug
:api_log_st
rem 检测日志是否有报错
for /f "delims=" %%a in ('findstr "警告: Fetch memory failed" log.txt') do (
  goto bug
)
goto log

:bug
rem 判断运行时间是否大于600秒
call :time %time1% %time%
if %te% GTR 60000 (
  echo API异常，已重启
  call :off API请勿关闭
  timeout /t 3 >nul
) else (
  echo API频繁异常，暂停60秒，重启云崽
  call :off %yunzainame%
  call :off API请勿关闭
  taskkill /f /im node.exe
  timeout /t 60
  call :miao
)
del /f /q api.txt >nul 2>nul
del /f /q hs_err_pid* >nul 2>nul
rem 删除日志，跳转到auto 大循环重启api
goto :auto


rem 启动 签名API，记录并展示启动时间
:api
set time1=%time%
echo %date%-%time%
>>logs.txt echo %date%-%time%
start start2.bat
exit /b

rem 结束 指定程序
:off
for /f "tokens=2 delims=," %%a in ('tasklist /v /fo csv^|find "%1"') do (
  taskkill /F /pid %%~a
)
exit /b

rem 延迟3秒启动云崽
:miao
PUSHD %yunzaipath%
start cmd /c "timeout /t 3 & %yunzai%"
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
