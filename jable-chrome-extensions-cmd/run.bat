@echo off
Setlocal enabledelayedexpansion
@REM 协议会触发这个文件

@REM 当前脚本目录
set currPath=%~dp0
@REM 接收参数
set param=%1
@REM 参数截取
set param=%param:~10,-1%
@REM base64解码
for /f "tokens=* delims=" %%# in ('%currPath%\base64.bat -decode %param%') do set "param=%%#"
@REM 调起下载程序
@REM echo %param%
@REM pause
%currPath%\N_m3u8DL-CLI_v2.9.7.exe %param%
