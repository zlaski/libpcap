@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "STEP=%1"
echo ======= Step: %STEP%

if "%STEP%" == "Test" (
    if exist "%ProjectName%.Tests.bat" (
        "%ProjectName%.Tests.bat"
    )
)

:: if "%STEP%" == "PreClean" ( ... )
:: if "%STEP%" == "PreBuild" ( ... )
:: if "%STEP%" == "PreLink" ( ... )

if "%STEP%" == "PostBuild" (
    _r -n -q mkdir %Install_RootPath%\include\pcap
    _r -n -q attrib -R %Install_RootPath%\include\pcap\*.* /S
    _r -q xcopy /s /i /y %ProjectDir%pcap %Install_RootPath%\include\pcap
    _r -q attrib +R %Install_RootPath%\include\pcap\*.* /S 
)

exit /b 0
