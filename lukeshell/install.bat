@echo off
:: ---- Admin check ----
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo hey dumbass, you need to run the script as administrator.
    pause
    exit /b
)

:: ---- Menu ----
cls
echo ============================
echo   LukeShell Setup Utility
echo ============================
echo.
echo 1. Install
echo 2. Uninstall
echo.
set /p choice=Select an option (1 or 2): 

if "%choice%"=="1" goto install
if "%choice%"=="2" goto uninstall

echo Invalid option.
pause
exit /b

:install
if not exist "%~dp0lshell\" (
    echo lshell folder not found in this folder.
    pause
    exit /b
)

echo Installing LukeShell...
move "%~dp0lshell" "%SystemRoot%\System32\" >nul
echo.
echo it has been installed, to run it open your command prompt and type in "lukeshell"
pause
exit /b

:uninstall
if not exist "%SystemRoot%\System32\lshell\" (
    echo LukeShell is not installed.
    pause
    exit /b
)

echo Uninstalling LukeShell...
rmdir /s /q "%SystemRoot%\System32\lshell"
echo Done. LukeShell removed from System32.
pause
exit /b
