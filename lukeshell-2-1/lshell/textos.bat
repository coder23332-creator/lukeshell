@echo off
title TextOS 1.1
mode con: cols=80 lines=25
color 1F

:: =====================
:: BOOT
:: =====================
:boot
cls
echo Booting TextOS...
ping localhost -n 2 >nul

:: =====================
:: DESKTOP
:: =====================
:desktop
cls
title TextOS Desktop
color 1F
echo ================================================================================
echo                                TEXTOS DESKTOP
echo ================================================================================
echo.
echo    [1] File Manager        [2] Calculator        [3] Notepad
echo.
echo    [4] LukeShell           [5] About             [6] Shutdown
echo.
echo ================================================================================
echo Taskbar: TextOS ^| User: %USERNAME% ^| Time: %TIME%
echo ================================================================================
echo.
set /p choice=Select an application (1-6): 

if "%choice%"=="1" goto files
if "%choice%"=="2" goto calc
if "%choice%"=="3" goto note
if "%choice%"=="4" goto lukeshell
if "%choice%"=="5" goto about
if "%choice%"=="6" goto shutdown

goto desktop

:: =====================
:: FILE MANAGER
:: =====================
:files
cls
title TextOS - File Manager
echo FILE MANAGER
echo ----------------------------------------------------------------------------
dir
echo.
pause
goto desktop

:: =====================
:: CALCULATOR
:: =====================
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

:: =====================
:: NOTEPAD
:: =====================
:note
cls
title TextOS - Notepad
echo Type text below and press ENTER.
echo Press CTRL+C to return to TextOS.
echo.
set /p text=
echo %text%>>TextOS_Notes.txt
goto note

:: =====================
:: LUKESHELL
:: =====================
:lukeshell
cls
title TextOS - LukeShell
echo ================================================================================
echo                              LukeShell Terminal
echo ================================================================================
echo.
echo Type "exit" to return to TextOS
echo.

:: LukeShell is in System32, so run it directly
lukeshell

echo.
echo LukeShell closed.
pause
goto desktop

:: =====================
:: ABOUT
:: =====================
:about
cls
title About TextOS
echo TextOS 1.1
echo.
echo A mini text-based operating system
echo running inside Windows Command Prompt.
echo.
echo Includes built-in LukeShell support.
echo.
pause
goto desktop

:: =====================
:: SHUTDOWN
:: =====================
:shutdown
cls
echo Shutting down TextOS...
ping localhost -n 2 >nul
exit
