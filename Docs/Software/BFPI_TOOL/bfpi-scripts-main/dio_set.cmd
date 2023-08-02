@echo off && SETLOCAL


Set "BFPITool=.\BFPIExec.exe"
::Define CMD
SET DIO_CAPS_CMD=0x00010000
:: LEVEL
SET DIO_GET_LVL_CMD=0x00010001
SET DIO_SET_LVL_CMD=0x00010002
:: DIRECTION
SET DIO_GET_DIR_CMD=0x00010003
SET DIO_SET_DIR_CMD=0x00010004

:: Check Pin Number
SET GET_PIN_NUM_CMD=%BFPITool% %DIO_CAPS_CMD% 0x10
For /F "skip=1" %%a in ('%GET_PIN_NUM_CMD%') do set PIN_NUM=%%a

If "%PIN_NUM%"=="0x0" (
    echo %PIN_NUM% Not Support
    EXIT /B\
)

echo PIN NUM: %PIN_NUM%
if "%1"=="" call :illustrate && EXIT /B
if "%2"=="" call :illustrate && EXIT /B
IF %2 EQU 0 (
    if "%3"=="" call :illustrate && EXIT /B
)

SET PIN=%1
SET DIR=%2
SET LVL=%3

echo PIN:%PIN% DIR:%DIR% LVL:%LVL%
echo Set Pin Direction
%BFPITool% %DIO_SET_DIR_CMD% 0x%DIR%000%PIN%

IF %DIR% EQU 0 (
    echo Set Pin Level
    %BFPITool% %DIO_SET_LVL_CMD% 0x%LVL%000%PIN%
)

SETLOCAL EnableDelayedExpansion

For /F "skip=1" %%m in ('%BFPITool% %DIO_GET_DIR_CMD% 0x%PIN%') do (
    IF "%%m"=="0x0" ( SET "dirq=OUTPUT" ) ELSE ( SET "dirq=INPUT" )
)
For /F "skip=1" %%n in ('%BFPITool% %DIO_GET_LVL_CMD% 0x%PIN%') do (
    IF "%%n"=="0x0" ( SET "lvlq=LOW" ) ELSE ( SET "lvlq=HIGH" )
)
echo PIN !PIN! : !dirq! !lvlq%! 

SETLOCAL DisableDelayedExpansion

ENDLOCAL
goto :eof

:illustrate
echo =====================================================================
echo             PIN OUT/IN LEVEL
echo ex: dio_set 0-7   0/1   0/1
echo     dio_set 0-7    0    0/1
echo     dio_set 0-7    1    ---
echo =====================================================================

EXIT /B