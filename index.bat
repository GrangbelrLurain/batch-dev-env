@echo off
::
:: Windows 개발 환경 컨트롤러 CLI (최종 수정본)
::
chcp 65001 > nul

:: 스크립트의 현재 경로를 기준으로 'core' 폴더의 절대 경로를 저장합니다.
set "CORE_PATH=%~dp0core"

echo.
echo ==================================================
echo   Windows Dev CLI
echo ==================================================
echo.

:menu
cls
echo.
echo ==================================================
echo   Windows Dev CLI - 메뉴를 선택하세요
echo ==================================================
echo.
echo   1. 개발 환경 설치 (setup)
echo   2. 개발 환경 삭제 (cleanup)
echo   3. 종료 (exit)
echo   4. 도움말 (help)
echo.
set /p "choice=선택 > "
echo.

if "%choice%" == "1" goto :setup
if "%choice%" == "2" goto :cleanup
if "%choice%" == "3" goto :exit
if "%choice%" == "4" goto :help
echo 올바르지 않은 입력입니다. 다시 시도하세요.
pause
goto :menu

:setup
echo [Setup] 개발 환경 설정을 시작합니다...
echo.
call "%CORE_PATH%\setup.bat"
pause
goto :menu

:cleanup
echo [Cleanup] 개발 환경 삭제를 시작합니다...
echo.
call "%CORE_PATH%\cleanup.bat"
pause
goto :menu

:exit
echo.
echo ==================================================
echo   종료합니다.
echo ==================================================
pause
goto :eof

:help
echo.
echo ==================================================
echo   사용법:
echo   dev setup   - 개발 환경을 설치합니다.
echo   dev cleanup - 개발 환경을 삭제합니다.
echo ==================================================
pause
goto :menu