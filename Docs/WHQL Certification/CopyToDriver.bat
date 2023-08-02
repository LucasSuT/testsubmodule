@echo off

set driverFolderPath=D:\Hi-Safe-v3\aaeonFramework
set appFolderPath=D:\Hi-Safe-v3\aaeonApp

xcopy .\STEP3\x64\drivers\aaeonFramework\* %driverFolderPath%\x64\Release\aaeonFramework /y
xcopy .\STEP3\x86\drivers\aaeonFramework\* %driverFolderPath%\Release\aaeonFramework /y

pause