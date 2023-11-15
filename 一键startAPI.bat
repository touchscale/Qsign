cd unidbg-fetch-qsign
:auto
start /w  start.bat
timeout /t 3
echo %time%-%date%  >>logs.txt
goto :auto