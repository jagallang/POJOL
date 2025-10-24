import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class DrawerMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const DrawerMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // 프로필 헤더
          _buildProfileHeader(context),
          
          // 메뉴 아이템들
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.calendar_today,
                  title: '위폴캘린더',
                  subtitle: '순찰 일정 관리',
                  index: 0,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.location_on,
                  title: '관내정보',
                  subtitle: '지역 정보 조회',
                  index: 1,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.chat_bubble_outline,
                  title: '실무챗봇',
                  subtitle: 'AI 업무 상담',
                  index: 2,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.gavel,
                  title: '법률정보',
                  subtitle: '법령 및 판례',
                  index: 3,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.calculate,
                  title: '나이계산기',
                  subtitle: '나이 계산 도구',
                  index: 4,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.photo_camera,
                  title: '현장사진편집기',
                  subtitle: '사진 편집 도구',
                  index: 5,
                ),
                const Divider(height: AppTheme.spacingL),
                _buildMenuItem(
                  context,
                  icon: Icons.settings,
                  title: '설정',
                  subtitle: '앱 설정 및 관리',
                  index: 6,
                ),
              ],
            ),
          ),
          
          // 하단 정보
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 아바타
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: AppTheme.white.withValues(alpha: 0.15),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppTheme.white, AppTheme.lightBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: AppTheme.primaryBlue,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingL),
          
          // 사용자 정보
          Text(
            '현장경찰관',
            style: GoogleFonts.notoSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingS,
            ),
            decoration: BoxDecoration(
              color: AppTheme.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Text(
              'POJOL 서비스 이용자',
              style: GoogleFonts.notoSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppTheme.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        gradient: isSelected 
            ? LinearGradient(
                colors: [AppTheme.lightBlue, AppTheme.white],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected ? AppTheme.cardShadow : null,
        border: isSelected
            ? Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.2), width: 1)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context); // 드로어 닫기
            onItemSelected(index);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: Row(
              children: [
                // 아이콘 컨테이너
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? AppTheme.primaryGradient
                        : LinearGradient(
                            colors: [
                              AppTheme.mediumGray.withValues(alpha: 0.1),
                              AppTheme.lightGray,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? AppTheme.white : AppTheme.mediumGray,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                
                // 텍스트 영역
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                          color: isSelected ? AppTheme.primaryBlue : AppTheme.darkGray,
                          letterSpacing: 0.25,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingXS),
                      Text(
                        subtitle,
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.mediumGray,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // 선택 표시
                if (isSelected)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        border: Border(
          top: BorderSide(
            color: AppTheme.mediumGray.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: AppTheme.mediumGray,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                'POJOL v1.0.0',
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: AppTheme.mediumGray,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            '현장경찰관 업무 보조 서비스',
            style: GoogleFonts.notoSans(
              fontSize: 10,
              color: AppTheme.mediumGray,
            ),
          ),
        ],
      ),
    );
  }
}
