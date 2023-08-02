@echo on
@echo =====================================START x64=====================================
@makecab /f makecab.ddf
XCOPY .\disk1\aaeonFramework.cab ..\..\STEP2\x64 /y
@cd ..\..\STEP2\x64
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
@d:
@echo:
@echo path=%cd%
@echo:
@call signed_file.bat aaeonFramework.cab
@echo =====================================x64 DONE=====================================
pause