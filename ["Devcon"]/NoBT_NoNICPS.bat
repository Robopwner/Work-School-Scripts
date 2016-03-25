@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
set devexec=R:\_DRC-Troy\Scripts\WDK10\
set scriptexec=R:\_DRC-Troy\Scripts\
if %OS%==32BIT echo This is a %OS% operating system && goto devconGo

if %OS%==64BIT echo This is a %OS% operating system && goto devconGo

:devconGo
%devexec%\"devcon_%OS%" disable "USB\VID_0A5C&PID_217F"
%devexec%\"devcon_%OS%" disable "USB\VID_8087&PID_07DC"
goto pshell

:pshell
Powershell.exe -ExecutionPolicy Bypass %scriptexec%\NIC_NoPowerShutoff.ps1
goto Done

:Done
echo Done!
pause
REM http://stackoverflow.com/questions/12322308/batch-file-to-check-64bit-or-32bit-os

