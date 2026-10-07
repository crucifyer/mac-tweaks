# mac-tweaks
맥의 고질적인 언어전환 문제를 gksdud 과 karabiner-elements, hammerspoon 으로 해결합니다.

## gksdud
빠릿빠릿한 한영전환기 [gksdud](https://github.com/codingnoye/gksdud) 을 설치하여 right_command 를 한영키로 사용하세요.

## Karabiner-Elements
karabiner-elements 를 설치하세요.
```bash
brew install --cask karabiner-elements
```

### Complex Midifications 에 아래의 기능들을 추가하세요.

right_option 을 한자/이모티콘 키로 변경 [hanjakey.json](karabiner/hanjakey.json)
- 한글 상태에서는 한자, 그 외에는 이모티콘 검색기가 됩니다.

한글(₩) 입력시 백틱(`) 변경 [backtick.json](karabiner/backtick.json)

마우스 이전/다음 버튼을 Finder 에 매핑 [finder.mouse.back.forward.json](karabiner/finder.mouse.back.forward.json)

원격/가상 데스크탑의 윈도우 특수키 배열로 변경 [remote.desktop.json](karabiner/remote.desktop.json)
- left_option, left_command 를 서로 바꾸어 ctrl, win, alt 순서로 만듭니다.
- right_command, right_option 을 alt, ctrl 로 바꾸어 한영, 한자 키로 인식시킵니다. 원격지의 키보드 종류가 korean 이면 잘 동작합니다.
- 윈도우가 아닌경우 right_command + right_option 으로 변환 상태를 해제할 수 있습니다.
- UTM 리눅스 ibus 라면 우상단 언어상태 클릭 > 키보드 설정 에서 한국어(Hangul) 만 남기고, 설정 에서 Alt_R, Ctrl_R 로 각각 할당하면 됩니다.
- UTM Mac 에서는 변환 상태를 해제하고 사용해야 하는데, 키보드 이벤트 전달이 안되므로 right_command 를 f18 에 할당하고, 이전 입력 소스 선택 에 f18 을 할당하고 사용합니다.

## 키보드의 Home, End 를 윈도우 처럼
```bash
mkdir ~/Library/KeyBindings
cd ~/Library/KeyBindings
curl -sSLO https://raw.githubusercontent.com/crucifyer/gksdud-karabiner/refs/heads/main/DefaultKeyBinding.dict
```
- 새로 실행한 앱 부터 적용됩니다. 재부팅 하는 것이 편합니다.
- home, end 를 누르면 커서가 줄의 맨 앞, 뒤 로 이동합니다.
- shift+ 로 선택도 잘 됩니다.
- slack 앱 처럼 줄 구별 없이 전체의 맨 앞, 뒤 로 이동하는 앱은 karabiner 에 등록하세요. [home.end.json](karabiner/home.end.json)

## HammerSpoon
hammerspoon 을 설치하세요.
```bash
brew install --cask hammerspoon
hs
cd ~/.hammerspoon
curl -sSLO https://raw.githubusercontent.com/crucifyer/gksdud-karabiner/refs/heads/main/hammerspoon/init.lua
curl -sSLO https://raw.githubusercontent.com/crucifyer/gksdud-karabiner/refs/heads/main/hammerspoon/windowsize.lua
```
기능별로 lua 파일을 분리하고 [init.lua](hammerspoon/init.lua) 에서 dofile 로 불러오세요.

창 크기 변경 [windowsize.lua](hammerspoon/windowsize.lua)
- control + option + 좌/우 : win + 좌/우 처럼 화면의 절반 크기로 변경
- control + option + 상/하 : 높이만 화면 절반 크기로 변경
- control + option + f : 화면 채우기
- control + shift + command + 방향키 : 해당 방향의 화면으로 이동하기
- control + option + command + 방향키 : 해당 방향의 화면으로 이동하고 채우기

## Scroll Reverser
```bash
brew install --cask scroll-reverser
```
- 맥북의 트랙패드의 스크롤은 종이를 미는 감각이므로 미는 방향으로 스크롤 되는 것이 자연스럽습니다.
- 마우스의 휠은 롤러를 돌리는 감각이므로 롤러 반대편의 종이는 반대쪽으로 밀려나는 것이 자연스럽습니다.