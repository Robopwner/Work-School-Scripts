@echo OFF

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
set devexec=U:\Devcon\WDK10
set scriptexec=U:\Devcon
if %OS%==32BIT echo This is a %OS% operating system && %devexec%\"devcon_%OS%" disable *bluetooth* && Powershell.exe %scriptexec%\NIC_NoPowerShutoff.ps1
if %OS%==64BIT echo This is a %OS% operating system && %devexec%\"devcon_%OS%" disable *bluetooth* && Powershell.exe %scriptexec%\NIC_NoPowerShutoff.ps1
echo Done!
pause
REM http://stackoverflow.com/questions/12322308/batch-file-to-check-64bit-or-32bit-os