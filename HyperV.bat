pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages*Hyper-V*.mum &gt;hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^&gt;nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
pause