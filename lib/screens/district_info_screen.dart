import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class DistrictInfoScreen extends StatelessWidget {
  const DistrictInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 검색 및 필터 섹션
          _buildSearchSection(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 관내정보 목록
          Expanded(
            child: _buildInfoList(context),
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
              Icons.location_on,
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
                  '관내정보',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '담당 지역의 주요 정보를 확인하세요',
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

  Widget _buildSearchSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          // 검색 바
          TextField(
            decoration: InputDecoration(
              hintText: '지역명, 시설명으로 검색...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  // 필터 기능 (향후 구현)
                },
              ),
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 카테고리 필터
          ResponsiveBuilder(
            builder: (context, screenSize) {
              return Wrap(
                spacing: AppTheme.spacingS,
                runSpacing: AppTheme.spacingS,
                children: [
                  _buildFilterChip('전체', true),
                  _buildFilterChip('학교', false),
                  _buildFilterChip('병원', false),
                  _buildFilterChip('상가', false),
                  _buildFilterChip('주거지역', false),
                  _buildFilterChip('공공시설', false),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        // 필터 선택 로직 (향후 구현)
      },
      selectedColor: AppTheme.lightBlue,
      checkmarkColor: AppTheme.primaryBlue,
      labelStyle: GoogleFonts.notoSans(
        color: isSelected ? AppTheme.primaryBlue : AppTheme.mediumGray,
        fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
      ),
    );
  }

  Widget _buildInfoList(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        return screenSize == ScreenSize.mobile
            ? _buildMobileList(context)
            : _buildDesktopGrid(context);
      },
    );
  }

  Widget _buildMobileList(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildInfoCard(context, index);
      },
    );
  }

  Widget _buildDesktopGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: AppTheme.spacingM,
        mainAxisSpacing: AppTheme.spacingM,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildInfoCard(context, index);
      },
    );
  }

  Widget _buildInfoCard(BuildContext context, int index) {
    final infoTypes = [
      {'name': '서울초등학교', 'type': '학교', 'distance': '0.5km', 'icon': Icons.school},
      {'name': '서울병원', 'type': '병원', 'distance': '1.2km', 'icon': Icons.local_hospital},
      {'name': '중앙상가', 'type': '상가', 'distance': '0.8km', 'icon': Icons.store},
      {'name': '아파트단지', 'type': '주거지역', 'distance': '0.3km', 'icon': Icons.home},
      {'name': '시청', 'type': '공공시설', 'distance': '2.1km', 'icon': Icons.account_balance},
    ];
    
    final info = infoTypes[index % infoTypes.length];
    
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingS),
                decoration: BoxDecoration(
                  color: AppTheme.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  info['icon'] as IconData,
                  color: AppTheme.primaryBlue,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info['name'] as String,
                      style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkGray,
                      ),
                    ),
                    Text(
                      info['type'] as String,
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: AppTheme.mediumGray,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingS,
                  vertical: AppTheme.spacingXS,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.successGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  info['distance'] as String,
                  style: GoogleFonts.notoSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.successGreen,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 연락처 및 주소 정보
          Row(
            children: [
              Icon(
                Icons.phone,
                size: 14,
                color: AppTheme.mediumGray,
              ),
              const SizedBox(width: AppTheme.spacingXS),
              Text(
                '02-1234-5678',
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: AppTheme.mediumGray,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.location_on,
                size: 14,
                color: AppTheme.mediumGray,
              ),
              const SizedBox(width: AppTheme.spacingXS),
              Text(
                '서울시 강남구',
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: AppTheme.mediumGray,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 액션 버튼들
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // 길찾기 기능 (향후 구현)
                  },
                  icon: const Icon(Icons.directions, size: 16),
                  label: const Text('길찾기'),
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // 상세보기 기능 (향후 구현)
                  },
                  icon: const Icon(Icons.info_outline, size: 16),
                  label: const Text('상세보기'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
