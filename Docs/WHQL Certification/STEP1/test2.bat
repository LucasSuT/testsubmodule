@set current=%cd%
@cd ..
@set root=%cd%
@echo =====================================START x64=====================================
@cd %root%\STEP1\x64
@makecab /f makecab.ddf
XCOPY .\disk1\aaeonFramework.cab ..\..\STEP2\x64 /y
@cd %root%\STEP2\x64
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
@d:
@echo:
@echo path=%cd%
@echo:
@call signed_file.bat aaeonFramework.cab
@echo =====================================x64 DONE=====================================
@echo on
pause
@echo =====================================START x86=====================================
@cd %root%\STEP1\x86
@makecab /f makecab.ddf
XCOPY .\disk1\aaeonFramework.cab ..\..\STEP2\x86 /y
@cd %root%\STEP2\x86
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
@d:
@echo:
@echo path=%cd%
@echo:
call signed_file.bat aaeonFramework.cab
@echo =====================================x86 DONE=====================================
pause