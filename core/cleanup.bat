@echo off
::
:: Windows 개발 환경 설치 도구들을 모두 삭제합니다.
:: 이 스크립트는 관리자 권한으로 실행해야 합니다.
::
:: -------------------------------------------------------------
:: 이 스크립트는 다음을 수행합니다.
:: 1. CMD 인코딩을 UTF-8로 변경
:: 2. 관리자 권한 확인
:: 3. Git, Node.js, Python, Windows Terminal, Oh My Posh 삭제
:: -------------------------------------------------------------
chcp 65001 > nul

echo.
echo ===========================================
echo   Windows 개발 환경 삭제를 시작합니다.
echo ===========================================
echo.
echo 이 스크립트는 설치했던 모든 도구(Git, Node.js 등)를 삭제합니다.
echo.
pause

:: Git, Node.js, Python, Windows Terminal, Oh My Posh 삭제
echo 필수 개발 도구들을 삭제합니다.
echo.
echo 잠시만 기다려주세요...
echo.

echo.
echo ===========================================
echo   Windows 개발 환경 삭제를 시작합니다.
echo ===========================================
echo.
echo 이 스크립트는 설치했던 모든 도구(Git, Node.js 등)를 삭제합니다.
echo.
pause

echo.
echo 필수 개발 도구들을 삭제합니다.
echo 잠시만 기다려주세요...
echo.

:: Git, Node.js, Python, Windows Terminal, Oh My Posh, Bun 삭제
choco uninstall git nodejs python3 microsoft-windows-terminal oh-my-posh bun -y
echo.

:: Scoop 삭제
where scoop >nul 2>nul
if %errorlevel% equ 0 (
    echo Scoop을 삭제합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "scoop uninstall scoop; scoop reset; Remove-Item -Recurse -Path 'C:\Users\$env:USER\scoop'"
) else (
    echo Scoop이 이미 삭제되어 있습니다.
)
echo.

:: PowerShell 모듈 삭제
echo PowerShell 모듈을 삭제합니다.
echo.

:: PSReadLine 모듈 삭제
powershell.exe -Command "Get-Module -Name PSReadLine -ListAvailable" | find "PSReadLine" >nul
if %errorlevel% equ 0 (
    echo PSReadLine 모듈을 삭제합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Remove-Module -Name PSReadLine -Force"
) else (
    echo PSReadLine 모듈이 이미 삭제되어 있습니다.
)
echo.

:: Terminal-Icons 모듈 삭제
powershell.exe -Command "Get-Module -Name Terminal-Icons -ListAvailable" | find "Terminal-Icons" >nul
if %errorlevel% equ 0 (
    echo Terminal-Icons 모듈을 삭제합니다...
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Remove-Module -Name Terminal-Icons -Force"
) else (
    echo Terminal-Icons 모듈이 이미 삭제되어 있습니다.
)
echo.

echo.
echo ===========================================
echo   모든 자동 삭제가 완료되었습니다.
echo ===========================================
echo.

pause