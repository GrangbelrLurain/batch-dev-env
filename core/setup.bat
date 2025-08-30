@echo off
::
:: 이 스크립트는 모든 필수 개발 도구를 자동으로 설치합니다.
:: 관리자 권한으로 실행해야 합니다.
::
:: -------------------------------------------------------------
:: 이 스크립트는 다음을 수행합니다.
:: 1. CMD 인코딩을 UTF-8로 변경
:: 2. 관리자 권한 확인
:: 3. Chocolatey 설치 (패키지 관리자)
:: 4. Git, Node.js, Python, Windows Terminal 설치
:: 5. Oh My Posh 설치
::
:: 이 스크립트가 끝난 후, PowerShell을 열어 수동으로 몇 가지 설정을 해야 합니다.
:: -------------------------------------------------------------
chcp 65001 > nul

echo.
echo ===========================================
echo   Windows 개발 환경 설정을 시작합니다.
echo ===========================================
echo.

:: Chocolatey가 이미 설치되어 있는지 확인
choco --version 2>nul
if %errorlevel% neq 0 (
    echo Chocolatey를 설치합니다...
    echo.
    powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    echo.
    echo Chocolatey 설치가 완료되었습니다.
    echo.
) else (
    echo Chocolatey가 이미 설치되어 있습니다.
    echo.
)

:: Git, Node.js, Python, Windows Terminal, Oh My Posh 설치
echo 필수 개발 도구들을 설치합니다.
echo.
echo 잠시만 기다려주세요...
echo.

:: Chocolatey가 이미 설치되어 있는지 확인
choco --version 2>nul
if %errorlevel% neq 0 (
    echo Chocolatey를 설치합니다...
    powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    echo Chocolatey 설치가 완료되었습니다.
) else (
    echo Chocolatey가 이미 설치되어 있습니다.
)
echo.

:: Scoop 설치 여부 확인
where scoop >nul 2>nul
if %errorlevel% neq 0 (
    echo Scoop을 설치합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh'))"
) else (
    echo Scoop이 이미 설치되어 있습니다.
)
echo.

echo 필수 개발 도구들을 설치합니다.
echo 잠시만 기다려주세요...
echo.
:: Git 설치 여부 확인
choco list git --local-only | find "git " >nul
if %errorlevel% neq 0 (
    echo Git을 설치합니다...
    choco install git -y
) else (
    echo Git이 이미 설치되어 있습니다.
)
echo.

:: Node.js 설치 여부 확인
choco list nodejs --local-only | find "nodejs " >nul
if %errorlevel% neq 0 (
    echo Node.js를 설치합니다...
    choco install nodejs -y
) else (
    echo Node.js가 이미 설치되어 있습니다.
)
echo.

:: Bun 설치 여부 확인
where bun >nul 2>nul
if %errorlevel% neq 0 (
    echo Bun을 설치합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "irm bun.sh/install.ps1 | iex"
) else (
    echo Bun이 이미 설치되어 있습니다.
)
echo.

:: Python3 설치 여부 확인
choco list python3 --local-only | find "python3 " >nul
if %errorlevel% neq 0 (
    echo Python3를 설치합니다...
    choco install python3 -y
) else (
    echo Python3가 이미 설치되어 있습니다.
)
echo.

:: Oh My Posh 설치 여부 확인
choco list oh-my-posh --local-only | find "oh-my-posh " >nul
if %errorlevel% neq 0 (
    echo Oh My Posh를 설치합니다...
    choco install oh-my-posh -y
) else (
    echo Oh My Posh가 이미 설치되어 있습니다.
)
echo.

:: PSReadLine 모듈 설치 여부 확인
powershell.exe -Command "Get-Module -Name PSReadLine -ListAvailable" | find "PSReadLine" >nul
if %errorlevel% neq 0 (
    echo PSReadLine 모듈을 설치합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Install-Module -Name PSReadLine -Force"
) else (
    echo PSReadLine 모듈이 이미 설치되어 있습니다.
)
echo.

:: Terminal-Icons 모듈 설치 여부 확인
powershell.exe -Command "Get-Module -Name Terminal-Icons -ListAvailable" | find "Terminal-Icons" >nul
if %errorlevel% neq 0 (
    echo Terminal-Icons 모듈을 설치합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Install-Module -Name Terminal-Icons -Force"
) else (
    echo Terminal-Icons 모듈이 이미 설치되어 있습니다.
)

echo.
echo ===========================================
echo   모든 자동 설치가 완료되었습니다.
echo ===========================================
echo.
echo 이제 PowerShell을 열어 수동으로 마지막 설정을 해야 합니다.
echo.

pause