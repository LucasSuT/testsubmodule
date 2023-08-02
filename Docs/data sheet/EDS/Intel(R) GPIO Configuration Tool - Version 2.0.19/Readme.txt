*********************************************************************************************************************************
Intel(R) GPIO Configuration Tool
VERSION 2.0.19
Mar 22, 2017
*********************************************************************************************************************************
README Contents
===============
1.  Introduction
2.  System Requirements
3.  Release Notes
4.  Installation Instructions
5.  Known Issues and Bug Reporting
6.  License Agreement

*********************************************************************************************************************************
1.  Introduction
================

The Intel® GPIO Configuration Tool allows user to view and configure GPIOs of SoC in real time. 
This provides user a flexibility to access/modify the GPIO settings on Intel Platforms during validation 
and tune the GPIO characteristics to verify their settings in real time. 

This README file contains release notes for the Intel(R) GPIO Configuration Tool, 
describing changes, any problems or issues that were known at the time of shipment.  
Please read the detailed User Manual file for all the features. 
 

2.  System Requirements

=======================

The Intel® GPIO Configuration Tool 

Supported Target Operating Systems:
===================================
   Microsoft® Windows Windows 10.x 		(Desktop Version - 64 & 32 bit)
   Microsoft® Windows Windows 8.x 		(64 & 32 bit)

Supported Intel Platforms:
==========================
   Intel® Code named Broxton, ApolloLake, CherryTrail and CherryTrail CR, BayTrail-T/CR Processor
   Intel® Code named Kabylake Processor for (ULX, ULT, DT and Halo SKUs)
   Intel® Code named Basinfalls HEDT platform
   Intel® Code named GeminiLake Processor for RVP1 SKU


.NET Framework Version: 4.5

3.Release Notes
=================
Release 2.0.19
   1. Added support for IOSTerm and IOSState fields for APL platform.

Bug Fix Release 2.0.18
   Fixed the following HSDs in this release
   1. HSD - 1604237315 - [GPIO_UEFI] : UEFI Tool is not working on BSF
   2. HSD - 1604237846 - [GPIO] : Alternate GPIO register values read as 0's on GLK
   3. HSD - 1604237897 - [GPIO] : Target name is repeated in GUI Internal build on GLK and Readme issue
   4. HSD - 1604237780 - [GPIO] : GPIO Pin values are not updating as expected in both GUI and UEFI Tool on GLK

Release 2.0.17
   1.Added support for GLK RVP1
   2.Added support for KBL Halo B0 silicon

Engineering Release 2.0.16
   1.Provided support for KabyLake B0 based platforms
   2.Updated the version of this engineering release to 2.0.16 in the tool

Engineering Release 2.0.15
   1.Fixed issue in ini file to copy the right driver for Win10
   2.Added latest GPIO golden configuration values from board team into GPIO Tool
   3.Updated the version of this engineering release to 2.0.15 in the tool

Engineering Release 2.0.14
   1.Provided support for CannonLake-Z0(SLKPCH), CannonLake-Z0(CNLPCH) boards
   2.Provided GPIO Verification feature in Direct Mode for internal version of the tool
   3.Provided GPIO Verification feature in File Mode for internal version of the tool

Release 2.0.13
   1. Fixed bugs from version 2.0.12
   1.a 1604191160.1: [GPIO] : Incorrect Tool version in GPIOTool.exe file properties
   1.b 1604190587.1: [GPIO]: "GPIOConfig.efi -d -c "South-West" -o 0x0500 -s RVP1" command is not working in UEFI as expected
   1.c 1604191215.1: [GPIO] : Terminology difference for GPIO Index and Name columns in GUI and UEFI 
       This has been fixed by updating the user manual with the appropriate UI names for these fields used in UEFI

Release 2.0.12
   1. Added support for Basinfalls(KBL HEDT) platform
   2. Added support for KBL-H0 Silicon based board
   3. Added address field for each GPIO pin in the display
   4. Added Horizontal scroll bar for KBL and APL views
   5. Added more command line options to UEFI utility.
   6. Added Filtered view support
   7. Disabled "Android Debugger" Target access mode
   8. Added SMI, NMI and RxState fields to KBL view 

Release 2.0.11
   1. HSD[1604126311] - All Interrupts Verification filelds are editable on BXT-M
   2. HSD[1604126318] - Tool will hang when double click on result field in ACPI Interrupts tab on BXT-M
   3. HSD[1604126278] - "(R)" Symbol is not present in the tool name in HTML report which is generated from windows build.
Known issue on APL:
  Un-installation from control panel is not completing successfully on APL system. 
  Alternative ways to un-install the tool
  - Please use the Setup.exe from installer and double click, choose un-install radio button and click Next button and follow the link.

Release 2.0.10
   1. Added support for KBL DT and Halo platforms
   2. Added HTML report generation feature
   3. Made PadMode editable by end user, which was read-only earlier
   4. Added support for HTML report generation from UEFI Application for Broxton, ApolloLake and Kabylake platforms

Release 2.0.9
   1. Added support for APL RVP1 and RVP2
   2. Added support for BXT platform
   3. Added support for Update operation in GPIO UI for File Access Mode also.
   4. Separate builds are provided for external and internal releases
   5. Modified User Manual format from .pdf to .rtf to fix Win10 Administrator issue.

 Release 2.0.8
   1. Added support for KBL ULX and ULT 
   2. Added support for APL RVP1 and RVP2 - only for engineering release and is not validated
   3. Added support for SKL ULX and ULT - only for engineering release and is not validated
   4. Disabled/Removed the socket access method 
   5. Disabled/Removed the Merge feature 
   6. Fixed some of the issues reported in the previous release

Release 2.0.7 
   1. Engineering release for APL RVP1 platform 
		   
Release 2.0.6
   1. Re-designed the code to MVVM Architecture.

Release 2.0.4
   New Features
   =========================
   1. Sofia Platform Support.
   2. Socket Method now has a choice for I/O interface defined by Model between MMIO and Sideband.
   3. Enhacements for supporting Sofia.


Release 2.0.3
   External Release Features
   =========================
   1. Access Methods - ADB, Direct, File.
   2. All the other features enhancements on v2.0.2 are available.

Release 2.0.2
   New Features
   ============
   1. Interrupt Verification.
      a) ACPI Interrupt Verification
      b) GPIO Interrupt Verification
   2. New Tab Control for displaying GPIO Configuration and Interrupt Verification added in GUI.
   3. Query Platform Type Dialogue giving options to select, between FFRD and CR platforms.
   4. Color Coding for GPIO's with Invalid values and Read Errors - Presented in Red Color.
   5. Merge Functionality minor Updates / Patches inline with UEFI changes.
   6. Internal and External Debug and Release Configurations, 
      which yield 2 builds for Internal and External Releases, each for Debug and Release Builds.

UEFI Changes
   ============
     a. UEFI modified to support new Platform Meta Data in Bin Files.
     b. UEFI script supports Cherrytrail CR now.
	•  While executing, need to add suffix “CHT_CR” at the end of the command line syntax.
	   o	EX: GpioConfig.efi –d CHT_CR
	   o	GpioConfig.efi –r File_name CHT_CR
	   o	GpioConfig.efi –u File_name CHT_CR

Release 2.0.1
   New Features
   ============
   1. Auto Refresh feature, available in new Options Menu.
      a)Checking / Selecting - Refresh Options 
          i) None - Stops the Auto Refresh
         ii) 2/5/10 Seconds - Starts Auto Refresh with 2/5/10 seconds gap between each refresh.
        iii) The seconds can be changed while Auto Refresh is in execution.
   
   2. Start Menu-> Apps Folder/Shortcuts - 2 are provided, viz.,
      a. Shortcut for the Tool with icon.
      b. Shortcut for Uninstalling the Tool with icon.

   3. Added Hotkeys (Keyboard Shortcuts) to the required Menu Options.
      Hotkeys - Menu Item Shortcuts for all menu item's.
           F1 - View Help Manual
           F2 - View About Box
           F9 - Launch Merge Tool

   UEFI Changes
   ============
        a. UEFI modified to support new Platform Meta Data in Bin Files.
           Limitation:
           UEFI script doesnt support Cherrytrail CR and Broxton for now.

   Fixed issues
   ============
        a. Tool Name now contains (R) - symbol where-ever appropriate.
        b. Licence Agreement document added in the installer, displayed before installation begins.
        c. AboutBox displays the version in default .NET style, modified format to display as required.
        d. All program Shortcuts not available on Windows 7.x.
        e. On Baytrail platform, (New issue found existing on 1.x as well)
           combobox selection just updates wrong value in PAD values, due to improper masks. 

   Known Issues
   ============
        a. The pins which displays invalid values (0xFFFFFFFF) and Combobox selection are not displayed.
           The pin has read failures or invalid read.
        b. Tool using Socket Access, displays Error in status Bar on Windows 7 or earlier versions
           "Websocket Protocol is not supported on this platform".
           Websocket support is available only on Windows 8 or above versions.

Release 2.0.0
    Core Features
    =============
    1. Redesign of the GPIO tool using WPF, MVVM Architecture, and Design Patterns.
    2. Added support for Broxton platform, tested in SIMICS environment, not fully validated.
    3. Added multiple Access Methods viz., 
	   a. File Access, 
	   b. Direct Access through HWAPI Driver, 
	   c. Android Debugger Access,
	   d. Socket Access.
    4. Support to validate and display the required GPIO for each platform.

    Known Issues
    ============
    1. Support for Broxton,
       a. Direct (MMIO) Access Works fine in this release, 
       b. Socket (SideBand) doesn't seem to work properly in this release.
       The test platform is currently SIMICS environment for Broxton.
    2. Some GPIO doesn't get updated as 
       a. some GPIO is dependent on few other properties, and 
       b. some GPIO doesn't allow updation, 
    One of the possibility is that OS / Component related could be modifying the values simultaneously.
    Hence the Update Fails in such cases, which is indicated in the status bar.
	
    Limitations
    ===========
    Refresh Feature is not yet supported.
   
Release 1.1.7
1. Fixed issues
	a. Merge feature is not working.
	b. Not able to launch the tool in CHT Android platform. Getting an "Unhandled exception has occurred in your application".
	
Release 1.1.6
1. Fixed issues
	a. Not able to launch the tool in CHT X64-bit platform. Getting an “Unhandled exception has occurred in your application”.
	b. When we launch the tool with BYT_Android tablet connected, tool is not displaying “Android window with Yes or No” options. 
	   Tool launches with Blank screen. But On CHT Android 64-bit tool is working fine.

Release 1.1.5
1. Fixed issues
	a. Tool Crashes on Baytrail CR - Android.
	b. Initialization sequence reordered to fix Crash on Tool Start.

Release 1.1.4
1. Fixed issues
	a. HSD ID: 5265832- Getting the default values, Even after values are changed and updated with Refresh Rate enable.
	b. Pwr column was not displaying correct values incase of Android platform.
	c. Refresh was happening when clicked on IntWakeCfg column.
	
Release 1.1.3
1. Features
	a. Added support for cherrytrail-T android.	

Release 1.1.2
1. Fixed issues
	a. HSD ID: 5090064- Copyright issues.
	b. HSD ID: 5090069- Tool version is not displaying while installing the tool and Main GUI.
	c. HSD ID: 5090079- Restore option is not working properly.
	d. HSD ID: 5090098- Merge file is saving in customized location instead of installation folder.
	e. HSD ID: 5220261- Refresh Rate function is not working.
	f. HSD ID: 5220263- Wake Interrupt "Enable/Disable All" options are not functioning properly.

Release 1.1.1
1. Fixed issues
	a. HSD ID: 5220287- Readme file issues.
	b. HSD ID: 5220273- Help Document issues.
	c. HSD ID: 5220268- Update option doesn't get disabled after click on the update.
	d. HSD ID: 5220253- GPIO settings are not updated after flashing the Merged firmware.
	e. HSD ID: 5220251- Tool is not running by enabling the Secure Boot.EFI Tool is not signed.


Release 1.1.0
1. Features
	a. Added support for cherrytrail.	

2. Fixed issues
	a. HSD ID: 5053868- While upgrading the tool, tool version is not reflected in the tool.
        b. HSD ID: 5053869- Column headings are not aligned properly.
        c. HSD ID: 5090100- Able to run the tool multiple instances.
	d. HSD ID: 5053871- In merge tool, select platform field accepting invalid inputs, doesn’t displayed any message.
	e. HSD ID: 5090067- Alignment is not proper in the GPIO Name column of SC and SUS.
	f. HSD ID: 5090094- In North Cluster tab, tool displays the GPIO names starting from 15 instead of 1.
	g. Klocwork issue fixes.

Release 1.0.2
1. Fixed issues
	a. Column headings are not aligned properly for SC and SUS panel.
	b. In merge tool, select platform field accepting invalid inputs, and doesn’t through any error
	c. While upgrading the tool, tool version was not reflected in the tool.
	d. Added support for BYT-CR and Android.

Release 1.0.1
1. Fixed issues
	a. Column headings are not aligned properly.
	b. In merge tool, select platform field accepting invalid inputs, and doesn’t through any error


Release 1.0.0
1. First Release with all the features listed in User Manual
   - Host, Target and UEFI(Command Line Only) based execution of tool
   - Target Based Execution
	- Display GPIO pin configurations
   	- Update GPIO pin configurations
   	- Generate Binary file with GPIO configuration information
        - Merge GPIO driver and GPIO binary configuration file into BIOS image
    - Host Based Execution
        - Load / Import GPIO configuration file	
        - Update GPIO pin configurations
	- Generate Binary file with GPIO configuration information
	- Merge GPIO driver and GPIO binary configuration file into BIOS image
    - UEFI Based Execution
	- Display all GPIO configurations
        - Generate GPIO configuration file
	- Update GPIO configuration fromm file

4.  Installation Instructions
=============================

The Intel(R) GPIO Configuration Tool comes as a zip folder with a setup.exe executable. 
Please follow the below provided instructions to install the tool.

1) Unzip the tool package 
2) Locate setup.exe executable at the root of the unzipped folder 
3) Then double click on setup.exe to start the installation process. 
4) Then follow the on screen instructions to complete the installation process.
This completes the installation and an icon will be created with Intel(R) GPIO Configuration Tool on the users desktop.
Use the icon to launch the tool. Please go through the user manual associated with the tool to know more information about the tool usage.

UEFI tools can be located in "C:\Program Files\Intel Corporation\Intel(R) GPIO Configuration Tool\UEFI" folder.
Procedure to use UEFI applicaitons:

1) Copy the appropriate GPIOConfig.efi for the given platform (x86 / x64) along with 
   the appropriate bin file for the platform to a pen driver at root location. 
2) Insert the pen drive to device under test. 
3) Then boot the system into EFI internal shell environment. 
4) The pen drive will be mapped to FS0/FS1 or FSx depending on the number of memory devices inserted into the 
   device under test. 
5) Then change to the appropriate FSx file system and look for GpioConfig.efi and GPIO bin file by issuing the file listing command “ls”.
6) Run the GpioConfig.efi command on the UEFI shell with out any parameters to see the help / documentation for commands and tool usage

5.  Known Issues and Bug Reporting
==================================

To report a bug on this utility, please submit the bug report to your Intel Field Representative.

• GUI does not fully support to handle advance Touch functionality.
• On EFI shell, file cannot be generated in custom path.
• The fields shown on UEFI shell are not one to one mapped with the fields shown on GPIO UI due to space limitation on EFI shell.
• The tool currently doesn't validate the GPIO field dependencies with each other before making configuration changes, for all the platforms.
  This feature has been enabled on experimental basis on UI application for Kabylake platform in release 2.0.8.
  User need to be aware of what congfiguration changes he/she is making and its consequences. 
  Updates to Pad Mode field may not succeed for some GPIOs as this field is conditional read only and controlled by SoftStraps
  Updates to Pad Mode field may cause system stability issues. So please be aware of what changes you are intended to make
• Un-installation from control panel is not completing successfully sometimes. 
  Alternative ways to un-install the tool
  - Please use the Setup.exe from installer and double click, choose un-install radio button and click Next button and follow the link.
. On APL the new certificate db_client_group_2017 is not added to APL BIOS certificate data base so the EFI tool fails to run when secure boot is enabled.
  We suggest users to try the EFI application by disabling the secure boot.

6. License Agreement:
============================================

This ReadMe file as well as the software described in it is furnished under license and may only be used or copied in 
accordance with the terms of the license. The information in this manual is furnished for informational use only, is
subject to change without notice, and should not be construed as a commitment by Intel Corporation.
Intel Corporation assumes no responsibility or liability for any errors or inaccuracies that may appear in this 
document or any software that may be provided in association with this document.

Except as permitted by such license, no part of this document may be reproduced, stored in a retrieval system, or transmitted
in any form or by any means without the express written consent of Intel Corporation. Information in this document is provided 
in connection with Intel products. No license, expressed or implied otherwise, to any intellectual property rights is granted 
by this document. Except as provided in Intel's Terms and Conditions of Sale for such products, Intel assumes no liability 
whatsoever, and Intel disclaims any express or implied warranty, relating to sale and/or use of Intel products including 
liability or warranties relating to fitness for a particular purpose, merchantability, or infringement of any patent, 
copyright or other intellectual property right. Intel products are not intended for use in medical, lifesaving, or life 
sustaining applications. Intel may make changes to specifications and product descriptions at any time, without notice.
Copyright (C) 2017 Intel Corporation. All rights reserved.

Intel is a trademark or registered trademark of Intel Corporation or its subsidiaries in the registered trademark of 
Intel Corporation or its subsidiaries in the United States and other countries.


**********************************************************************************************************************************************
