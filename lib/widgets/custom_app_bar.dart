import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'responsive_layout.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showDrawerButton;
  final VoidCallback? onDrawerPressed;
  final VoidCallback? onMenuTogglePressed;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showDrawerButton = false,
    this.onDrawerPressed,
    this.onMenuTogglePressed,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            boxShadow: AppTheme.elevatedShadow,
          ),
          child: AppBar(
            title: Row(
              children: [
                // 개선된 POJOL 로고
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.white, AppTheme.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.local_police,
                    color: AppTheme.primaryBlue,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                // 앱 이름
                Text(
                  'POJOL',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingL),
                // 현재 화면 제목
                if (screenSize != ScreenSize.mobile) ...[
                  Container(
                    height: 24,
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.white.withValues(alpha: 0.3),
                          AppTheme.white.withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingL),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.notoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white.withValues(alpha: 0.95),
                        letterSpacing: 0.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
            leading: leading ?? _buildLeadingButtons(context, screenSize),
            actions: [
              // 데스크톱에서는 프로필 아이콘 표시
              if (screenSize == ScreenSize.desktop) ...[
                _buildActionButton(
                  icon: Icons.notifications_outlined,
                  onPressed: () {},
                  badge: true,
                ),
                _buildActionButton(
                  icon: Icons.account_circle_outlined,
                  onPressed: () {},
                ),
              ],
              // 모바일에서는 현재 화면 제목을 액션으로 표시
              if (screenSize == ScreenSize.mobile) ...[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppTheme.spacingL),
                    child: Container(
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
                        title,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              if (actions != null) ...actions!,
            ],
            backgroundColor: Colors.transparent,
            foregroundColor: AppTheme.white,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool badge = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingXS),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
              iconSize: 20,
            ),
          ),
          if (badge)
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppTheme.warningOrange,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeadingButtons(BuildContext context, ScreenSize screenSize) {
    if (screenSize == ScreenSize.mobile) {
      // 모바일에서는 드로어 버튼만 표시
      return _buildDrawerButton(context);
    } else {
      // 데스크톱에서는 항상 사이드바 토글 버튼 표시
      return _buildMenuToggleButton(context);
    }
  }

  Widget _buildDrawerButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: onDrawerPressed ?? () {
        Scaffold.of(context).openDrawer();
      },
    );
  }

  Widget _buildMenuToggleButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.view_sidebar),
      onPressed: onMenuTogglePressed,
      tooltip: '사이드바 토글',
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
