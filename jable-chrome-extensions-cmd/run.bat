@echo off
Setlocal enabledelayedexpansion

@REM 协议会触发这个文件

@REM 视频下载目录
set savepath=C:\Users\Public\Downloads
set currPath=%~dp0
set abc=%1
set param=%abc:~10,-1%
for /f "tokens=1-2 delims=;" %%a in ("%param%") do (
	set url=%%a
	set filename=%%b
)
@REM echo url %url%
@REM echo name %filename%
for /f "tokens=* delims=" %%# in ('%currPath%\base64.bat -decode %filename%') do set "filename=%%#"
@REM echo %filename%
@REM echo %currPath%
%currPath%\N_m3u8DL-CLI_v2.9.7.exe %url% --saveName "%filename%" --workDir %savepath% --enableDelAfterDone --disableDateInfo
@REM pause