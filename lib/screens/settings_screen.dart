import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 설정 목록
          Expanded(
            child: _buildSettingsList(context),
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
              Icons.settings,
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
                  '설정',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '앱 설정 및 계정을 관리하세요',
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

  Widget _buildSettingsList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 프로필 섹션
          _buildProfileSection(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 일반 설정 섹션
          _buildGeneralSettingsSection(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 알림 설정 섹션
          _buildNotificationSettingsSection(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 보안 설정 섹션
          _buildSecuritySettingsSection(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 앱 정보 섹션
          _buildAppInfoSection(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
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
            '프로필',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 프로필 정보
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppTheme.lightBlue,
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '현장경찰관',
                      style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkGray,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingXS),
                    Text(
                      '서울경찰청 강남서',
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // 프로필 편집 기능 (향후 구현)
                },
                child: const Text('편집'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSettingsSection(BuildContext context) {
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
            '일반 설정',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          _buildSettingItem(
            icon: Icons.language,
            title: '언어',
            subtitle: '한국어',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.palette,
            title: '테마',
            subtitle: '라이트 모드',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.text_fields,
            title: '글꼴 크기',
            subtitle: '보통',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.storage,
            title: '데이터 사용량',
            subtitle: 'Wi-Fi에서만 동기화',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettingsSection(BuildContext context) {
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
            '알림 설정',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          _buildSwitchItem(
            icon: Icons.notifications,
            title: '푸시 알림',
            subtitle: '중요한 업무 알림을 받습니다',
            value: true,
            onChanged: (value) {},
          ),
          
          _buildSwitchItem(
            icon: Icons.schedule,
            title: '일정 알림',
            subtitle: '순찰 일정을 미리 알려드립니다',
            value: true,
            onChanged: (value) {},
          ),
          
          _buildSwitchItem(
            icon: Icons.chat_bubble_outline,
            title: '챗봇 알림',
            subtitle: '새로운 메시지 알림',
            value: false,
            onChanged: (value) {},
          ),
          
          _buildSwitchItem(
            icon: Icons.update,
            title: '업데이트 알림',
            subtitle: '앱 업데이트 소식을 받습니다',
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildSecuritySettingsSection(BuildContext context) {
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
            '보안 설정',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          _buildSettingItem(
            icon: Icons.lock,
            title: '비밀번호 변경',
            subtitle: '계정 보안을 위해 정기적으로 변경하세요',
            onTap: () {},
          ),
          
          _buildSwitchItem(
            icon: Icons.fingerprint,
            title: '생체 인증',
            subtitle: '지문 또는 얼굴 인식으로 로그인',
            value: true,
            onChanged: (value) {},
          ),
          
          _buildSwitchItem(
            icon: Icons.security,
            title: '2단계 인증',
            subtitle: '추가 보안을 위해 활성화',
            value: false,
            onChanged: (value) {},
          ),
          
          _buildSettingItem(
            icon: Icons.history,
            title: '로그인 기록',
            subtitle: '최근 로그인 내역을 확인하세요',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAppInfoSection(BuildContext context) {
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
            '앱 정보',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          _buildSettingItem(
            icon: Icons.info_outline,
            title: '버전 정보',
            subtitle: 'v1.0.0 (Build 1)',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.description,
            title: '이용약관',
            subtitle: '서비스 이용약관을 확인하세요',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.privacy_tip,
            title: '개인정보처리방침',
            subtitle: '개인정보 보호정책을 확인하세요',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.help_outline,
            title: '도움말',
            subtitle: '자주 묻는 질문과 사용법',
            onTap: () {},
          ),
          
          _buildSettingItem(
            icon: Icons.contact_support,
            title: '고객지원',
            subtitle: '문의사항이나 버그 신고',
            onTap: () {},
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 로그아웃 버튼
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                // 로그아웃 기능 (향후 구현)
              },
              icon: const Icon(Icons.logout),
              label: const Text('로그아웃'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.errorRed,
                side: const BorderSide(color: AppTheme.errorRed),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(AppTheme.spacingS),
        decoration: BoxDecoration(
          color: AppTheme.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: AppTheme.primaryBlue,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.darkGray,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.notoSans(
          fontSize: 12,
          color: AppTheme.mediumGray,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(AppTheme.spacingS),
        decoration: BoxDecoration(
          color: AppTheme.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: AppTheme.primaryBlue,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.darkGray,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.notoSans(
          fontSize: 12,
          color: AppTheme.mediumGray,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
