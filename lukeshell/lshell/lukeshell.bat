@echo off
color 2
cd /d C:\

echo Welcome to Luke's Shell
echo To find an IP address, please run:
echo ping example.com

echo To launch TextOS please run:
echo textos
echo.

:loop
set /p cmd=LukeShell^> 
if "%cmd%"=="" goto loop
if /i "%cmd%"=="exit" exit

%cmd%
goto loop
