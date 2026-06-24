@echo off
title Advanced Chrome Repair Tool for Windows 10
color 0A

echo ==========================================
echo     ADVANCED CHROME REPAIR TOOL
echo ==========================================
echo.

echo [1/10] Closing Google Chrome...
taskkill /F /IM chrome.exe >nul 2>&1

echo [2/10] Clearing Chrome Cache...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache" 2>nul
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\ShaderCache" 2>nul

echo [3/10] Flushing DNS...
ipconfig /flushdns

echo [4/10] Resetting Winsock...
netsh winsock reset

echo [5/10] Resetting IP...
netsh int ip reset

echo [6/10] Cleaning Temporary Files...
del /f /s /q "%TEMP%\*" >nul 2>&1

echo [7/10] Checking System Files...
sfc /scannow

echo [8/10] Repairing Windows Image...
DISM /Online /Cleanup-Image /RestoreHealth

echo [9/10] Checking Disk...
chkdsk C: /scan

echo [10/10] Repair Complete.

echo.
echo ==========================================
echo        Repair Finished Successfully
echo ==========================================
echo.
pause