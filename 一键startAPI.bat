@ echo off
cd unidbg-fetch-qsign
set te=8640000
set yunzaipath="..\Yunzai-Bot"
set yunzai=node app

:auto
call :api
rem 启动 签名API并等待结束

rem 判断运行时间是否大于600秒
call :time %time1% %time2%
if %te% GTR 60000 (
    rem 满足，输出文本
    echo API异常，已重启
    timeout /t 3

) else (
    rem 不满足，则延迟60秒，然后重启云崽
    echo API频繁异常，暂停60秒，重启云崽
    taskkill /f /im node.exe
    timeout /t 60

    call :miao
)

rem 跳转到auto标签（实现循环）
goto :auto



rem 启动 签名API，记录并展示启动时间
:api
set time1=%time%
echo %time%-%date%
>>logs.txt echo %time%-%date%

start /w start.bat
set time2=%time%
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
