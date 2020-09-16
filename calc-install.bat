@echo off

echo Taking ownership of calc.exe...
takeown /f %SystemRoot%\system32\calc.exe /a
cacls %SystemRoot%\system32\calc.exe /g Administrators:F  Users:R 2>null

echo Taking ownership of calc.exe.mui...
takeown /f %SystemRoot%\system32\en-US\calc.exe.mui /a
cacls %SystemRoot%\system32\en-US\calc.exe /g Administrators:F 2>null

echo Copying calc.exe...
if exist %SystemRoot%\system32\calc.old.exe del %SystemRoot%\system32\calc.old.exe
ren %SystemRoot%\system32\calc.exe calc.old.exe
copy   %~dp0\calc.exe %SystemRoot%\system32\calc.exe

echo Copying calc.exe.mui...
if exist %SystemRoot%\system32\en-US\calc.old.exe.mui del %SystemRoot%\system32\en-US\calc.old.exe.mui
ren %SystemRoot%\system32\en-US\calc.exe.mui calc.old.exe.mui
copy  %~dp0\calc.exe.mui %SystemRoot%\system32\en-US\calc.exe.mui
