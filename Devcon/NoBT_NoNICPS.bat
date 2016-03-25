@echo OFF

REM Determine if OS is 32 or 64 bit
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
REM Location of Devcon
set devexec= 
REM Location of other Scripts
set scriptexec=
if %OS%==32BIT echo This is a %OS% operating system && goto devconGo

if %OS%==64BIT echo This is a %OS% operating system && goto devconGo

REM Disables hardware; You will need to Vendor ID and Product ID - Found in Device Manager under Details, in Hardware IDs
:devconGo
%devexec%\"devcon_%OS%" disable "USB\VID_0A5C&PID_217F"
%devexec%\"devcon_%OS%" disable "USB\VID_8087&PID_07DC"
goto pshell

REM Lauches a powershell script to turn off "Allow the Computer to turn off this device to save power" feature
:pshell
Powershell.exe -ExecutionPolicy Bypass %scriptexec%\NIC_NoPowerShutoff.ps1
goto Done

:Done
echo Done!
pause
REM http://stackoverflow.com/questions/12322308/batch-file-to-check-64bit-or-32bit-os
