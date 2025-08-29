# Windows 개발 환경 자동 설정 스크립트

이 README.md는 PowerShell을 중심으로 한 Windows 개발 환경을 자동으로 구축해주는 배치 스크립트의 사용법을 안내합니다.

이 스크립트는 WSL(Windows Subsystem for Linux)을 사용하지 않고, 윈도우 네이티브 환경에서 효율적인 개발 환경을 원하는 개발자를 위해 만들어졌습니다.

## 🚀 주요 기능

- 원클릭 설치: Chocolatey 패키지 관리자를 통해 Git, Node.js, Python, Windows Terminal을 자동으로 설치합니다.

- 깔끔한 셸 환경: Oh My Posh와 posh-git을 설치하여, Git 상태를 한눈에 확인할 수 있는 멋진 프롬프트를 구성합니다.

- 문제 해결 자동화: CMD의 인코딩 문제, 스크립트 실행 권한 문제 등을 자동으로 처리하여 초기 설정을 간소화합니다.

## ⚙️ 사용 방법

1. setup.bat를 오른쪽 버튼으로 클릭한 다음, **관리자 권한으로 실행**을 선택합니다.

2. 메뉴를 선택하여 필요한 기능을 설치합니다.

## 📝 수동으로 해야 할 마지막 단계

자동 설치가 완료된 후, PowerShell을 열어 몇 가지 최종 설정을 수동으로 진행해야 합니다.

### PowerShell 실행 정책 변경:

스크립트 실행을 허용하는 보안 정책을 설정합니다. 다음 명령어를 입력하고 [Y]를 누르세요.

```PowerShell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

### posh-git 모듈 설치:

Git 상태를 프롬프트에 표시해 줄 posh-git 모듈을 설치합니다.

```PowerShell
Install-Module -Name posh-git -Scope CurrentUser
```

### PowerShell 프로필 파일 설정:

Oh My Posh와 posh-git이 PowerShell 시작 시 자동으로 로드되도록 프로필 파일을 수정합니다.

```PowerShell
code $PROFILE
```

파일이 열리면 다음 코드를 복사해서 붙여넣습니다.
만약 vscode등 IDE에서 사용하고 싶다면 vscode shell에서 동일하게 설정을 추가해야 합니다.

```PowerShell
Import-Module posh-git
Invoke-Expression (oh-my-posh --init --shell pwsh --config '$HOME\AppData\Local\Programs\oh-my-posh\themes\jandedobbeleer.omp.json')
```

### 폰트 설치:

테마 아이콘이 깨지지 않도록 Nerd Fonts를 설치하고, Windows Terminal 설정에서 해당 폰트를 선택합니다.

[Fira Code Nerd Font 다운로드](https://github.com/ryanoasis/nerd-fonts/releases)

Windows Terminal 설정(Ctrl+,)에서 PowerShell 프로필의 **글꼴**을 **FiraCode Nerd Font**로 변경합니다.

## 🛠️ FAQ 및 문제 해결

- 스크립트 실행이 안 돼요: 배치 파일을 관리자 권한으로 실행했는지 확인하세요.

- 프롬프트에 테마가 적용되지 않아요:

  위의 수동 설정 3단계를 올바르게 완료했는지 확인하세요.

  posh-git과 oh-my-posh가 제대로 설치되었는지 Get-Module -ListAvailable [모듈이름]으로 확인하세요.

- 글자가 깨져 보여요:

  Windows Terminal을 사용하고 있는지 확인하세요.

  폰트가 올바르게 설치되고 터미널 설정에 적용되었는지 다시 확인하세요.
