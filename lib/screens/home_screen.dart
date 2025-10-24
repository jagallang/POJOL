import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/responsive_layout.dart';
import 'we_pol_calendar_screen.dart';
import 'district_info_screen.dart';
import 'chatbot_screen.dart';
import 'law_info_screen.dart';
import 'age_calculator_screen.dart';
import 'photo_editor_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSidebarOpen = true; // 사이드바 열림/닫힘 상태

  final List<Widget> _screens = [
    const WePolCalendarScreen(),
    const DistrictInfoScreen(),
    const ChatbotScreen(),
    const LawInfoScreen(),
    const AgeCalculatorScreen(),
    const PhotoEditorScreen(),
    const SettingsScreen(),
  ];

  final List<String> _screenTitles = [
    '위폴캘린더',
    '관내정보',
    '실무챗봇',
    '법률정보',
    '나이계산기',
    '현장사진편집기',
    '설정',
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onBottomNavTapped(int index) {
    // 하단 네비게이션에서 더보기 탭을 누르면 드로어 열기
    if (index == 3) {
      _scaffoldKey.currentState?.openDrawer();
    } else {
      _onItemSelected(index);
    }
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            title: _screenTitles[_selectedIndex],
            showDrawerButton: screenSize == ScreenSize.mobile,
            onDrawerPressed: () => _scaffoldKey.currentState?.openDrawer(),
            onMenuTogglePressed: _toggleSidebar,
          ),
          drawer: screenSize == ScreenSize.mobile
              ? DrawerMenu(
                  selectedIndex: _selectedIndex,
                  onItemSelected: _onItemSelected,
                )
              : null,
          body: Row(
            children: [
              // 데스크톱 사이드바
              if (screenSize == ScreenSize.desktop) ...[
                AnimatedContainer(
                  duration: AppTheme.mediumAnimation,
                  curve: Curves.easeInOut,
                  width: _isSidebarOpen ? 280 : 0,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    boxShadow: _isSidebarOpen ? AppTheme.cardShadow : null,
                  ),
                  child: _isSidebarOpen
                      ? DrawerMenu(
                          selectedIndex: _selectedIndex,
                          onItemSelected: _onItemSelected,
                        )
                      : const SizedBox.shrink(),
                ),
              ],
              
              // 메인 컨텐츠
              Expanded(
                child: _screens[_selectedIndex],
              ),
            ],
          ),
          bottomNavigationBar: screenSize == ScreenSize.mobile
              ? CustomBottomNavBar(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onBottomNavTapped,
                )
              : null,
        );
      },
    );
  }
}
