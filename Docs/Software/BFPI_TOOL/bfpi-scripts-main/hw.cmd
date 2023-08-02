@echo off && SETLOCAL

SET "BFPITool=.\BFPIExec.exe"
call :init

::Return data according to input
::bit   8       7       6       5       4       3       2       1       0
::TEMP                                                  SYS2    SYS1    CPU
::FANS                                  Chasis2 Chasis1 SYS2    SYS1    CPU
::VOLT  VCORE   VMEM    +12V    +5V     +3.3V   +1.8V   5VSB    3VSB    VBAT

SETLOCAL EnableDelayedExpansion
::Get HW Capabilities
FOR /L %%i IN (0,1,2) DO (
    FOR /F "skip=1" %%m in ('!HW_CAPS_CMD[%%i]!') DO (
        call :hex_to_bin %%m
        ::echo Caps[%%i]: %%m --^> !bin!
        IF %%i EQU 0 (
            SET /a caps_temp_mask=%%m
            call :caps_temp !bin!
            call :get_temp
        )
        IF %%i EQU 1 (
            SET /a caps_fans_mask=%%m
            call :caps_fans !bin!
            call :get_fans
        )
        IF %%i EQU 2 (
            SET /a caps_volt_mask=%%m
            call :caps_volt !bin!
            call :get_volt
        )
    )
)


SETLOCAL DisableDelayedExpansion
ENDLOCAL
EXIT /B

:init
::Define CMD
SET SUPPORT_CAPS_CMD=0x00030000
::Capabilities
::2       1       0
::TEMP    FANS    VOLT
SET HW_CAPS_CMD[0]=%BFPITool% %SUPPORT_CAPS_CMD% 0x12
SET HW_CAPS_CMD[1]=%BFPITool% %SUPPORT_CAPS_CMD% 0x13
SET HW_CAPS_CMD[2]=%BFPITool% %SUPPORT_CAPS_CMD% 0x14

SET READ_SENSOR_CMD=0x00030001
::Temperature
::2       1       0
::CPU0    SYS1    SYS2
SET GET_TEMP_CMD[0]=%BFPITool% %READ_SENSOR_CMD% 0x0000
SET GET_TEMP_CMD[1]=%BFPITool% %READ_SENSOR_CMD% 0x1000
SET GET_TEMP_CMD[2]=%BFPITool% %READ_SENSOR_CMD% 0x2000
::Fan
::4       3       2       1       0
::Chasis2 Chasis1 SYS2    SYS1    CPU
SET GET_FANS_CMD[0]=%BFPITool% %READ_SENSOR_CMD% 0x0100
SET GET_FANS_CMD[1]=%BFPITool% %READ_SENSOR_CMD% 0x1100
SET GET_FANS_CMD[2]=%BFPITool% %READ_SENSOR_CMD% 0x2100
SET GET_FANS_CMD[3]=%BFPITool% %READ_SENSOR_CMD% 0x3100
SET GET_FANS_CMD[4]=%BFPITool% %READ_SENSOR_CMD% 0x4100
::Voltage
::8       7       6       5       4       3       2       1       0
::VBAT    3VSB    5VSB    +1.8V   +3.3V   +5V     +12V    VMEM    VCORE
SET GET_VOLT_CMD[0]=%BFPITool% %READ_SENSOR_CMD% 0x0200
SET GET_VOLT_CMD[1]=%BFPITool% %READ_SENSOR_CMD% 0x1200
SET GET_VOLT_CMD[2]=%BFPITool% %READ_SENSOR_CMD% 0x2200
SET GET_VOLT_CMD[3]=%BFPITool% %READ_SENSOR_CMD% 0x3200
SET GET_VOLT_CMD[4]=%BFPITool% %READ_SENSOR_CMD% 0x4200
SET GET_VOLT_CMD[5]=%BFPITool% %READ_SENSOR_CMD% 0x5200
SET GET_VOLT_CMD[6]=%BFPITool% %READ_SENSOR_CMD% 0x6200
SET GET_VOLT_CMD[7]=%BFPITool% %READ_SENSOR_CMD% 0x7200
SET GET_VOLT_CMD[8]=%BFPITool% %READ_SENSOR_CMD% 0x8200

SET STR_TEMP[0]=CPU0 
SET STR_TEMP[1]=SYS1 
SET STR_TEMP[2]=SYS2 

SET STR_FANS[0]=CPU0 
SET STR_FANS[1]=SYS1 
SET STR_FANS[2]=SYS2 
SET STR_FANS[3]=CHS1 
SET STR_FANS[4]=CHS2 
                
SET STR_VOLT[0]=VCORE
SET STR_VOLT[1]=VMEM 
SET STR_VOLT[2]=+12V 
SET STR_VOLT[3]=+5V  
SET STR_VOLT[4]=+3.3V
SET STR_VOLT[5]=+1.8V
SET STR_VOLT[6]=5VSB 
SET STR_VOLT[7]=3VSB 
SET STR_VOLT[8]=VBAT 

goto :eof

:hex_to_bin

set Hex=%1
Set bin=%Hex:0x=%

Set bin=!bin:0=0000!
Set bin=!bin:1=0001!
Set bin=!bin:2=0010!
Set bin=!bin:3=0011!
Set bin=!bin:4=0100!
Set bin=!bin:5=0101!
Set bin=!bin:6=0110!
Set bin=!bin:7=0111!
Set bin=!bin:8=1000!
Set bin=!bin:9=1001!
Set bin=!bin:A=1010!
Set bin=!bin:B=1011!
Set bin=!bin:C=1100!
Set bin=!bin:D=1101!
Set bin=!bin:E=1110!
Set bin=!bin:F=1111!
Set bin=!bin:a=1010!
Set bin=!bin:b=1011!
Set bin=!bin:c=1100!
Set bin=!bin:d=1101!
Set bin=!bin:e=1110!
Set bin=!bin:f=1111!
goto :eof


:caps_temp
::Capabilities 0110
::2       1       0
::TEMP    FANS    VOLT
SET para=%1
FOR /L %%i in (1,1,4) DO (
    SET tmp=!para:~-%%i,1!
    ::echo bit[-%%i]: !tmp!
    SET /a sft=%%i-1
    ::shift: !sft!
    IF !tmp! EQU 0 ( SET r[!sft!]=X ) ELSE ( SET r[!sft!]=O )
    SET var_caps_temp[!sft!]=!tmp!
)

echo. && echo TEMP CAPS[%para%]
echo  ^|---------------------------^|
echo  ^|bit   2       1       0    ^|
echo  ^|     SYS2    SYS1    CPU0  ^|
echo  ^|---------------------------^|
echo  ^|CAPS  !r[2]!      !r[1]!      !r[0]!   ^|
echo  ^|---------------------------^|
EXIT /B

:caps_fans
::Fan 0000-0110
::4       3       2       1       0
::Chasis2 Chasis1 SYS2    SYS1    CPU
SET para=%1
FOR /L %%i in (1,1,8) DO (
    SET tmp=!para:~-%%i,1!
    ::echo bit[-%%i]: !tmp!
    SET /a sft=%%i-1
    ::shift: !sft!
    IF !tmp! EQU 0 ( SET r[!sft!]=X ) ELSE ( SET r[!sft!]=O )
    SET var_caps_fans[!sft!]=!tmp!
)

echo. && echo FANS CAPS[%para%]
echo  ^|-------------------------------------------^|
echo  ^|bit   4       3       2       1       0    ^|
echo  ^|     CHS2    CHS1    SYS2    SYS1    CPU0  ^|
echo  ^|-------------------------------------------^|
echo  ^|CAPS  !r[4]!       !r[3]!      !r[2]!      !r[1]!      !r[0]!  ^|
echo  ^|-------------------------------------------^|
EXIT /B

:caps_volt
::Voltage 0001-1111-1111
::8       7       6       5       4       3       2       1       0
::VBAT    3VSB    5VSB    +1.8V   +3.3V   +5V     +12V    VMEM    VCORE
SET para=%1
FOR /L %%i in (1,1,12) DO (
    SET tmp=!para:~-%%i,1!
    ::echo bit[-%%i]: !tmp!
    SET /a sft=%%i-1
    ::shift: !sft!
    IF !tmp! EQU 0 ( SET r[!sft!]=X ) ELSE ( SET r[!sft!]=O )
    SET var_caps_volt[!sft!]=!tmp!
)

echo. && echo VOLT CAPS[%para%]
echo  ^|---------------------------------------------------------------------------^|
echo  ^|bit   8       7       6       5       4       3       2       1       0    ^|
echo  ^|     VBAT    3VSB    5VSB    +1.8V   +3.3V   +5V     +12V    VMEM    VCORE ^|
echo  ^|---------------------------------------------------------------------------^|
echo  ^|CAPS  !r[8]!      !r[7]!       !r[6]!      !r[5]!       !r[4]!      !r[3]!      !r[2]!     !r[1]!      !r[0]!  ^|
echo  ^|---------------------------------------------------------------------------^|
EXIT /B


:get_temp
::Get HW Temperature in mini-Degree °C
FOR /L %%i IN (0,1,2) DO (
    IF !var_caps_temp[%%i]! EQU 1 (
        For /F "skip=1" %%m in ('!GET_TEMP_CMD[%%i]!') do (
            SET /a tmp=%%m
            SET dcm=!tmp:~,-3!
            SET frc=!tmp:~-3,2!
            echo [%%i] !STR_TEMP[%%i]!: !dcm!.!frc! 'C
        )
    ) ELSE (
        echo [%%i] !STR_TEMP[%%i]!: NOT SUPPORT
    )
)
EXIT /B

:get_fans
::Get HW Fans in rpm
FOR /L %%i IN (0,1,4) DO (
    IF !var_caps_fans[%%i]! EQU 1 (
        For /F "skip=1" %%m in ('!GET_FANS_CMD[%%i]!') do (
            SET /a tmp=%%m
            echo [%%i] !STR_FANS[%%i]!: !tmp! RPM
        )
    ) ELSE (
        echo [%%i] !STR_FANS[%%i]!: NOT SUPPORT
    )
)
EXIT /B

:get_volt
::Get Voltage in mV
FOR /L %%i IN (0,1,8) DO (
    IF !var_caps_volt[%%i]! EQU 1 (
        For /F "skip=1" %%m in ('!GET_VOLT_CMD[%%i]!') do (
            SET /a tmp=%%m
            SET dcm=!tmp:~,-3!
            SET frc=!tmp:~-3,3!
            echo [%%i] !STR_VOLT[%%i]!: !dcm!.!frc! V
        )
    ) ELSE (
        echo [%%i] !STR_VOLT[%%i]!: NOT SUPPORT
    )
)
EXIT /B
