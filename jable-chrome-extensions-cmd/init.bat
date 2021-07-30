@echo on
SETLOCAL ENABLEDELAYEDEXPANSION
@REM %currPath%\run.bat
@REM set hostFileName=host.json
@REM set regFilename=init.reg
@REM set extensionId=einoieghfplfhbepdhnipiadbpkpigcn
@REM set pluginName=N_m3u8DL-CLI_v2.9.7.exe
@REM set extensionName=com.google.chrome.jable
set newProtocol=newProtocol.reg
set currPath=%~dp0
set runBatPath=%currPath%run.bat
set currPath=%currPath:\=\\%


@REM del /a /f /s %hostFileName%
@REM del /a /f /s %regFilename%
@REM del /a /f /s %newProtocol%

@REM call :newJson %hostFileName%,%extensionId%,%pluginName%
@REM call :newReg %regFilename%,%hostFileName%
@REM call :newProtocol %newProtocol%
call :regProtocol %runBatPath%

echo 完成
echo on
exit

@REM :newJson
@REM echo { >>%1
@REM echo     "name": "%extensionName%", >>%1
@REM echo     "description": "com.google.chrome.jable", >>%1
@REM echo     "path": "./%3", >>%1
@REM echo     "type": "stdio", >>%1
@REM echo     "allowed_origins": [ >>%1
@REM echo         "chrome-extension://%2/" >>%1
@REM echo     ] >>%1
@REM echo } >>%1
@REM goto :eof

@REM :newProtocol
@REM echo Windows Registry Editor Version 5.00 >> %1
@REM echo [HKEY_CLASSES_ROOT\M3U8dl] >> %1
@REM echo @="M3U8dlProtocol" >> %1
@REM echo "URL Protocol"="%currPath%run.bat" >> %1
@REM echo [HKEY_CLASSES_ROOT\M3U8dl\DefaultIcon] >> %1
@REM echo @="%currPath%run.bat,1" >> %1
@REM echo [HKEY_CLASSES_ROOT\M3U8dl\shell] >> %1
@REM echo [HKEY_CLASSES_ROOT\M3U8dl\shell\open] >> %1
@REM echo [HKEY_CLASSES_ROOT\M3U8dl\shell\open\command] >> %1
@REM echo @="\"%currPath%run.bat\" \"%1\"" >> %1
@REM goto :eof

@REM 注册一个协议
:regProtocol
REG DELETE "HKCR\M3U8dl" /f
REG ADD "HKCR\M3U8dl" /ve /t REG_SZ /d "M3U8dlProtocol" /f
REG ADD "HKCR\M3U8dl" /v "URL Protocol" /t REG_SZ /d "%1" /f
REG ADD "HKCR\M3U8dl\DefaultIcon" /ve /t REG_SZ /d "%1,1" /f
REG ADD "HKCR\M3U8dl\shell" /f
REG ADD "HKCR\M3U8dl\shell\open" /f
REG ADD "HKCR\M3U8dl\shell\open\command" /ve /t REG_SZ /d "\"%1\" \"%%1\"" /f
goto :eof