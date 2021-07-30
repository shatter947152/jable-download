@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set currPath=%~dp0
set runBatPath=%currPath%run.bat
set currPath=%currPath:\=\\%
call :regProtocol %runBatPath%

echo 完成
echo on
exit

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