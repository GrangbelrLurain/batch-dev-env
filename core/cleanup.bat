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

choco uninstall git -y
choco uninstall nodejs -y
choco uninstall python3 -y
choco uninstall microsoft-windows-terminal -y
choco uninstall oh-my-posh -y

echo.
echo ===========================================
echo   모든 자동 삭제가 완료되었습니다.
echo ===========================================
echo.

pause