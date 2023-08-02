@echo off && SETLOCAL

Set "BFPITool=.\BFPIExec.exe"
::Define CMD
SET DIO_CAPS_CMD=0x00010000
SET DIO_GET_LVL_CMD=0x00010001
SET DIO_GET_DIR_CMD=0x00010003

call :init

For /F "skip=1" %%a in ('%DIO_Capability_CMD[0]%') do set DIO_Capability_result[0]=%%a
For /F "skip=1" %%a in ('%DIO_Capability_CMD[1]%') do set DIO_Capability_result[1]=%%a
For /F "skip=1" %%a in ('%DIO_Capability_CMD[2]%') do set DIO_Capability_result[2]=%%a
For /F "skip=1" %%a in ('%DIO_Capability_CMD[3]%') do set DIO_Capability_result[3]=%%a

If "%DIO_Capability_result[0]%"=="0x0" (Set "DIO_Capability_result[0]=Not Support")
If "%DIO_Capability_result[1]%"=="0x0" (Set "DIO_Capability_result[1]=Not Support")
If "%DIO_Capability_result[2]%"=="0x0" (Set "DIO_Capability_result[2]=Not Support")
If "%DIO_Capability_result[3]%"=="0x0" (Set "DIO_Capability_result[3]=Not Support")

:: Print Result
echo =====================================================================
echo [PIN CAPABILITIES]
echo 0x10: Supported GPIO pin number      :  %DIO_Capability_result[0]%
echo 0x11: Supported GPIO Input Bit Map   :  %DIO_Capability_result[1]%
echo 0x12: Supported GPIO Output Bit Map  :  %DIO_Capability_result[2]%
echo 0x13: Supported GPIO Driving Bit Map :  %DIO_Capability_result[3]%

IF "%DIO_Capability_result[0]%"=="Not Support" (EXIT /B)

echo PIN NUM: %DIO_Capability_result[0]:0x=%
SET /a PIN_NUM=%DIO_Capability_result[0]:0x=%-1

echo =====================================================================
echo [PIN DIR/LEVEL]
SETLOCAL EnableDelayedExpansion

FOR /L %%p IN (0,1,%PIN_NUM%) DO (
    For /F "skip=1" %%m in ('%BFPITool% %DIO_GET_DIR_CMD% 0x%%p') do (
        IF "%%m"=="0x0" ( SET "m=OUTPUT" ) ELSE ( SET "m=INPUT" )
    )
    For /F "skip=1" %%n in ('%BFPITool% %DIO_GET_LVL_CMD% 0x%%p') do (
        IF "%%n"=="0x0" ( SET "n=LOW" ) ELSE ( SET "n=HIGH" )
    )

    echo PIN %%p : !m!  !n! 
)

SETLOCAL DisableDelayedExpansion

ENDLOCAL
goto :eof


:init
::0x10: Supported GPIO pin number
Set DIO_Capability_CMD[0]=%BFPITool% %DIO_CAPS_CMD% 0x10
::0x11: Supported GPIO Input Bit Map
Set DIO_Capability_CMD[1]=%BFPITool% %DIO_CAPS_CMD% 0x11
::0x12: Supported GPIO Output Bit Map
Set DIO_Capability_CMD[2]=%BFPITool% %DIO_CAPS_CMD% 0x12
::0x13: Supported GPIO Driving Bit Map
Set DIO_Capability_CMD[3]=%BFPITool% %DIO_CAPS_CMD% 0x13

EXIT /B

