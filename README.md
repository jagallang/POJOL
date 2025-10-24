# POJOL (Police Officer Joint Online)

현장경찰관 업무 보조 서비스

## 📱 프로젝트 소개

POJOL은 현장 경찰관들의 업무 효율성을 높이기 위한 종합 업무 지원 애플리케이션입니다.

## ✨ 주요 기능

### 1. 위폴캘린더
- 순찰 일정 관리
- 근무 스케줄 확인

### 2. 관내정보
- 지역 정보 조회
- 관할 구역 데이터

### 3. 실무챗봇
- AI 기반 업무 상담
- 실시간 질의응답

### 4. 법률정보
- 법령 및 판례 검색
- 법률 참고자료

### 5. 나이계산기
- 연령 계산 도구
- 법적 나이 확인

### 6. 현장사진편집기
- 사진 편집 기능
- 증거 자료 관리

## 🛠 기술 스택

- **Framework**: Flutter 3.29.2 / Dart 3.7.2
- **Backend**: Firebase (Hosting, Authentication, Firestore)
- **UI**: Material Design 3, Google Fonts (Noto Sans)
- **State Management**: Provider
- **Architecture**: 반응형 레이아웃 (모바일/태블릿/데스크톱 지원)

## 🚀 시작하기

### 필수 요구사항

- Flutter SDK 3.29.2 이상
- Dart 3.7.2 이상

### 설치 및 실행

```bash
# 의존성 설치
flutter pub get

# 웹 실행
flutter run -d chrome

# 모바일 실행
flutter run -d ios      # iOS
flutter run -d android  # Android

# 프로덕션 빌드
flutter build web
flutter build apk
flutter build ios
```

## 🌐 배포

### Firebase Hosting
- **Production URL**: https://pojol-4947f.web.app
- **Alternative URL**: https://pojol-4947f.firebaseapp.com

### 배포 방법

```bash
# 웹 빌드
flutter build web --release

# Firebase 배포
firebase deploy --only hosting
```

## 📁 프로젝트 구조

```
lib/
├── main.dart                 # 앱 진입점
├── firebase_options.dart     # Firebase 설정
├── screens/                  # 화면 모듈
│   ├── home_screen.dart
│   ├── we_pol_calendar_screen.dart
│   ├── district_info_screen.dart
│   ├── chatbot_screen.dart
│   ├── law_info_screen.dart
│   ├── age_calculator_screen.dart
│   ├── photo_editor_screen.dart
│   └── settings_screen.dart
├── widgets/                  # 재사용 위젯
│   ├── custom_app_bar.dart
│   ├── drawer_menu.dart
│   ├── bottom_nav_bar.dart
│   └── responsive_layout.dart
└── theme/                    # 디자인 시스템
    └── app_theme.dart
```

## 🔧 개발 명령어

```bash
# 코드 분석
flutter analyze

# 테스트 실행
flutter test

# 코드 포맷팅
flutter format .

# 빌드 캐시 정리
flutter clean
```

## 📄 라이선스

이 프로젝트는 비공개 프로젝트입니다.

## 👥 기여자

- 개발: Claude Code AI Assistant
- 기획: jagallang

---

🤖 Generated with [Claude Code](https://claude.com/claude-code)
