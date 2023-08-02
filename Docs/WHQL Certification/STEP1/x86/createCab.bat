@echo on
@echo =====================================START x86=====================================
@makecab /f makecab.ddf
XCOPY .\disk1\aaeonFramework.cab ..\..\STEP2\x86 /y
@cd ..\..\STEP2\x86
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
@d:
@echo:
@echo path=%cd%
@echo:
@call signed_file.bat aaeonFramework.cab
@echo =====================================x86 DONE=====================================
pause