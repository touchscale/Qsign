cd unidbg-fetch-qsign
:auto
start /w  start.bat
timeout /t 3
>>logs.txt echo %time%-%date%
goto :auto