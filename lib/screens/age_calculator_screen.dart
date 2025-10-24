import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class AgeCalculatorScreen extends StatelessWidget {
  const AgeCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 계산기 영역
          Expanded(
            child: ResponsiveBuilder(
              builder: (context, screenSize) {
                return screenSize == ScreenSize.mobile
                    ? _buildMobileCalculator(context)
                    : _buildDesktopCalculator(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calculate,
              color: AppTheme.primaryBlue,
              size: 32,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '나이계산기',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '생년월일로 한국나이와 만나이를 계산하세요',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCalculator(BuildContext context) {
    return Column(
      children: [
        // 입력 영역
        _buildInputSection(context),
        
        const SizedBox(height: AppTheme.spacingL),
        
        // 결과 영역
        Expanded(
          child: _buildResultSection(context),
        ),
      ],
    );
  }

  Widget _buildDesktopCalculator(BuildContext context) {
    return Row(
      children: [
        // 입력 영역
        Expanded(
          flex: 1,
          child: _buildInputSection(context),
        ),
        
        const SizedBox(width: AppTheme.spacingL),
        
        // 결과 영역
        Expanded(
          flex: 1,
          child: _buildResultSection(context),
        ),
      ],
    );
  }

  Widget _buildInputSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '생년월일 입력',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 생년월일 입력 필드
          TextField(
            decoration: InputDecoration(
              labelText: '생년월일',
              hintText: 'YYYY-MM-DD 형식으로 입력',
              prefixIcon: const Icon(Icons.calendar_today),
            ),
            keyboardType: TextInputType.datetime,
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 현재 날짜 표시
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.today,
                  color: AppTheme.mediumGray,
                  size: 20,
                ),
                const SizedBox(width: AppTheme.spacingS),
                Text(
                  '기준일: 2024년 10월 12일',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 계산 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // 나이 계산 기능 (향후 구현)
              },
              icon: const Icon(Icons.calculate),
              label: const Text('나이 계산하기'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '계산 결과',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 한국나이 결과
          _buildAgeResult(
            '한국나이',
            '35세',
            '출생 시 1세로 계산',
            Icons.cake,
            AppTheme.primaryBlue,
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 만나이 결과
          _buildAgeResult(
            '만나이',
            '33세',
            '생일이 지나야 증가',
            Icons.event,
            AppTheme.secondaryBlue,
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 세는나이 결과
          _buildAgeResult(
            '세는나이',
            '34세',
            '연도 차이로 계산',
            Icons.calendar_month,
            AppTheme.successGreen,
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 추가 정보
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.lightBlue.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppTheme.primaryBlue,
                      size: 16,
                    ),
                    const SizedBox(width: AppTheme.spacingS),
                    Text(
                      '나이 계산 기준',
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingS),
                Text(
                  '• 한국나이: 출생 시 1세, 매년 1월 1일 증가\n• 만나이: 생일이 지나야 증가\n• 세는나이: 연도 차이로 계산',
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    color: AppTheme.mediumGray,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeResult(String title, String age, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppTheme.white,
              size: 20,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkGray,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  age,
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  description,
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
