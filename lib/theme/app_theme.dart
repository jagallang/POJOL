import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 개선된 색상 팔레트
  static const Color primaryBlue = Color(0xFF0D47A1); // 더 진한 네이비 블루
  static const Color secondaryBlue = Color(0xFF1976D2); // 밝은 블루
  static const Color accentBlue = Color(0xFF42A5F5); // 액센트 블루
  static const Color lightBlue = Color(0xFFE3F2FD); // 연한 블루
  static const Color darkBlue = Color(0xFF0A3D91); // 어두운 블루
  
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF8F9FA);
  static const Color mediumGray = Color(0xFF6C757D);
  static const Color darkGray = Color(0xFF343A40);
  static const Color errorRed = Color(0xFFDC3545);
  static const Color successGreen = Color(0xFF28A745);
  static const Color warningOrange = Color(0xFFFF9800);
  
  // 그라데이션 색상
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, secondaryBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [white, lightBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // 테마 데이터
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: secondaryBlue,
        tertiary: accentBlue,
        surface: lightGray,
        error: errorRed,
        brightness: Brightness.light,
      ),
      
      // 앱바 테마
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.notoSans(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: white,
          letterSpacing: 0.5,
        ),
        iconTheme: const IconThemeData(color: white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      
      // 텍스트 테마
      textTheme: GoogleFonts.notoSansTextTheme().copyWith(
        headlineLarge: GoogleFonts.notoSans(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: primaryBlue,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.notoSans(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: primaryBlue,
          letterSpacing: -0.25,
        ),
        headlineSmall: GoogleFonts.notoSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: primaryBlue,
        ),
        titleLarge: GoogleFonts.notoSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: darkGray,
          letterSpacing: 0.15,
        ),
        titleMedium: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: darkGray,
          letterSpacing: 0.1,
        ),
        bodyLarge: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: darkGray,
          letterSpacing: 0.15,
        ),
        bodyMedium: GoogleFonts.notoSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: darkGray,
          letterSpacing: 0.25,
        ),
        bodySmall: GoogleFonts.notoSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: mediumGray,
          letterSpacing: 0.4,
        ),
        labelLarge: GoogleFonts.notoSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: primaryBlue,
          letterSpacing: 0.1,
        ),
      ),
      
      // 카드 테마
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: white,
        margin: const EdgeInsets.all(8),
        shadowColor: primaryBlue.withValues(alpha: 0.1),
      ),
      
      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: white,
          elevation: 0,
          shadowColor: primaryBlue.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryBlue,
          side: BorderSide(color: primaryBlue, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
        ),
      ),
      
      // 입력 필드 테마
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: mediumGray.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: mediumGray.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: errorRed),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        labelStyle: GoogleFonts.notoSans(
          color: mediumGray,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: GoogleFonts.notoSans(
          color: mediumGray.withValues(alpha: 0.7),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      
      // 드로어 테마
      drawerTheme: DrawerThemeData(
        backgroundColor: white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      
      // 하단 네비게이션 테마
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: white,
        selectedItemColor: primaryBlue,
        unselectedItemColor: mediumGray,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: GoogleFonts.notoSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        unselectedLabelStyle: GoogleFonts.notoSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
      ),
      
      // 플로팅 액션 버튼 테마
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: secondaryBlue,
        foregroundColor: white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      // 아이콘 테마
      iconTheme: IconThemeData(
        color: primaryBlue,
        size: 24,
      ),
      
      // 체크박스 테마
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return white;
        }),
        checkColor: WidgetStateProperty.all(white),
        side: BorderSide(color: mediumGray, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // 스위치 테마
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryBlue;
          }
          return mediumGray;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return lightBlue;
          }
          return lightGray;
        }),
      ),
    );
  }
  
  // 개선된 그림자 스타일
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: primaryBlue.withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: primaryBlue.withValues(alpha: 0.04),
      blurRadius: 6,
      offset: const Offset(0, 1),
      spreadRadius: 0,
    ),
  ];
  
  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: primaryBlue.withValues(alpha: 0.12),
      blurRadius: 24,
      offset: const Offset(0, 8),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: primaryBlue.withValues(alpha: 0.06),
      blurRadius: 8,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];
  
  static List<BoxShadow> get floatingShadow => [
    BoxShadow(
      color: primaryBlue.withValues(alpha: 0.15),
      blurRadius: 32,
      offset: const Offset(0, 12),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: primaryBlue.withValues(alpha: 0.08),
      blurRadius: 12,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];
  
  // 간격 상수
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  
  // 반응형 브레이크포인트
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  
  // 애니메이션 지속시간
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
}
