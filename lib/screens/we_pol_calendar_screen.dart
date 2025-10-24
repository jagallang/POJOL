import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class WePolCalendarScreen extends StatelessWidget {
  const WePolCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 달력 섹션
          Expanded(
            child: ResponsiveBuilder(
              builder: (context, screenSize) {
                return screenSize == ScreenSize.mobile
                    ? _buildMobileCalendar(context)
                    : _buildDesktopCalendar(context);
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
              Icons.calendar_today,
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
                  '위폴캘린더',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '순찰 일정과 업무를 체계적으로 관리하세요',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // 일정 추가 기능 (향후 구현)
            },
            icon: const Icon(Icons.add),
            label: const Text('일정 추가'),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCalendar(BuildContext context) {
    return Column(
      children: [
        // 월/년도 표시
        Container(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left),
              ),
              Text(
                '2024년 10월',
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryBlue,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: AppTheme.spacingM),
        
        // 달력 그리드
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: _buildCalendarGrid(),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopCalendar(BuildContext context) {
    return Row(
      children: [
        // 달력
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              children: [
                // 월/년도 네비게이션
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Text(
                      '2024년 10월',
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingM),
                Expanded(child: _buildCalendarGrid()),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: AppTheme.spacingL),
        
        // 일정 목록
        Expanded(
          flex: 1,
          child: Container(
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
                  '오늘의 일정',
                  style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingM),
                Expanded(
                  child: ListView(
                    children: [
                      _buildScheduleItem('오전 순찰', '09:00', AppTheme.primaryBlue),
                      _buildScheduleItem('민원 접수', '14:00', AppTheme.secondaryBlue),
                      _buildScheduleItem('보고서 작성', '16:00', AppTheme.successGreen),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    return Column(
      children: [
        // 요일 헤더
        Row(
          children: ['일', '월', '화', '수', '목', '금', '토']
              .map((day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: day == '일' ? AppTheme.errorRed : AppTheme.darkGray,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        
        const SizedBox(height: AppTheme.spacingS),
        
        // 달력 날짜들
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: 35, // 5주 * 7일
            itemBuilder: (context, index) {
              final day = index - 6; // 첫 주는 이전 달 날짜들
              final isCurrentMonth = day > 0 && day <= 31;
              final isToday = day == 12; // 예시로 12일을 오늘로 설정
              
              return Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isToday ? AppTheme.primaryBlue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    isCurrentMonth ? day.toString() : '',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday ? AppTheme.white : AppTheme.darkGray,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleItem(String title, String time, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingS),
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
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
                  time,
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
