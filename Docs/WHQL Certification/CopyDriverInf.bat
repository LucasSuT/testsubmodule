@echo off

set driverFolderPath=D:\Hi-Safe-v3\aaeonFramework

xcopy %driverFolderPath%\x64\Release\aaeonFramework\* .\STEP1\x64 /y

xcopy %driverFolderPath%\Release\aaeonFramework\* .\STEP1\x86 /y

pause