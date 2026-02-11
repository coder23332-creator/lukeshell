@echo off
title TextOS 1.0
mode con: cols=80 lines=25
color 1F

:boot
cls
echo Booting TextOS...
ping localhost -n 2 >nul
goto desktop

:desktop
cls
color 1F
echo ================================================================================
echo                                TEXTOS DESKTOP
echo ================================================================================
echo.
echo    [1] File Manager        [2] Calculator        [3] Notepad
echo.
echo    [4] Settings            [5] About             [6] Shutdown
echo.
echo ================================================================================
echo Taskbar: TextOS ^| User: %USERNAME% ^| Time: %TIME%
echo ================================================================================
echo.
set /p choice=Select an application (1-6): 

if "%choice%"=="1" goto files
if "%choice%"=="2" goto calc
if "%choice%"=="3" goto note
if "%choice%"=="4" goto settings
if "%choice%"=="5" goto about
if "%choice%"=="6" goto shutdown

goto desktop

:files
cls
title TextOS - File Manager
echo FILE MANAGER
echo ----------------------------------------------------------------------------
dir
echo.
pause
goto desktop

:calc
cls
title TextOS - Calculator
set /p a=Enter first number: 
set /p b=Enter second number: 
set /a result=%a% + %b%
echo.
echo Result: %result%
pause
goto desktop

:note
cls
title TextOS - Notepad
echo Type text below. Press CTRL+C to exit.
echo.
set /p text=
echo %text%>>TextOS_Notes.txt
goto note

:settings
cls
echo SETTINGS
echo ----------------------------------------------------------------------------
echo 1. Change Color
echo 2. Back
set /p s=Choice: 

if "%s%"=="1" (
  color 2F
)
goto desktop

:about
cls
echo TextOS 1.0
echo A mini text-based operating system
echo Running inside Windows Command Prompt
echo.
pause
goto desktop

:shutdown
cls
echo Shutting down TextOS...
ping localhost -n 2 >nul
exit
