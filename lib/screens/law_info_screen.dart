import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class LawInfoScreen extends StatelessWidget {
  const LawInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 검색 및 카테고리 섹션
          _buildSearchSection(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 법률정보 목록
          Expanded(
            child: _buildLawList(context),
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
              Icons.gavel,
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
                  '법률정보',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '법령 및 판례 정보를 검색하고 확인하세요',
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
              hintText: '법령명, 조항, 키워드로 검색...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.tune),
                onPressed: () {
                  // 고급 검색 기능 (향후 구현)
                },
              ),
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 카테고리 탭
          ResponsiveBuilder(
            builder: (context, screenSize) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryTab('전체', true),
                    _buildCategoryTab('형법', false),
                    _buildCategoryTab('형사소송법', false),
                    _buildCategoryTab('경범죄처벌법', false),
                    _buildCategoryTab('도로교통법', false),
                    _buildCategoryTab('주민등록법', false),
                    _buildCategoryTab('판례', false),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: AppTheme.spacingS),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          // 카테고리 선택 로직 (향후 구현)
        },
        selectedColor: AppTheme.lightBlue,
        checkmarkColor: AppTheme.primaryBlue,
        labelStyle: GoogleFonts.notoSans(
          color: isSelected ? AppTheme.primaryBlue : AppTheme.mediumGray,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildLawList(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        return screenSize == ScreenSize.mobile
            ? _buildMobileList(context)
            : _buildDesktopList(context);
      },
    );
  }

  Widget _buildMobileList(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return _buildLawCard(context, index);
      },
    );
  }

  Widget _buildDesktopList(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return _buildLawCard(context, index);
      },
    );
  }

  Widget _buildLawCard(BuildContext context, int index) {
    final lawItems = [
      {
        'title': '형법 제250조 (살인)',
        'content': '사람을 살해한 자는 사형, 무기 또는 5년 이상의 징역에 처한다.',
        'category': '형법',
        'bookmarked': false,
      },
      {
        'title': '형사소송법 제200조 (체포와 구속의 영장)',
        'content': '체포 또는 구속을 함에는 반드시 영장을 받아야 한다.',
        'category': '형사소송법',
        'bookmarked': true,
      },
      {
        'title': '경범죄처벌법 제1조 (경범죄의 범위)',
        'content': '이 법에서 정하는 경범죄는 다음 각 호와 같다.',
        'category': '경범죄처벌법',
        'bookmarked': false,
      },
      {
        'title': '도로교통법 제43조 (음주운전)',
        'content': '누구든지 술에 취한 상태에서 자동차를 운전하여서는 아니 된다.',
        'category': '도로교통법',
        'bookmarked': true,
      },
      {
        'title': '주민등록법 제7조 (신고의무)',
        'content': '거주지가 변경된 때에는 14일 이내에 신고하여야 한다.',
        'category': '주민등록법',
        'bookmarked': false,
      },
    ];
    
    final item = lawItems[index % lawItems.length];
    
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
        border: Border.all(
          color: (item['bookmarked'] as bool)
              ? AppTheme.primaryBlue.withValues(alpha: 0.3)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목과 북마크
          Row(
            children: [
              Expanded(
                child: Text(
                  item['title'] as String,
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // 북마크 토글 기능 (향후 구현)
                },
                icon: Icon(
                  (item['bookmarked'] as bool) 
                      ? Icons.bookmark 
                      : Icons.bookmark_border,
                  color: (item['bookmarked'] as bool) 
                      ? AppTheme.primaryBlue 
                      : AppTheme.mediumGray,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingS),
          
          // 카테고리 태그
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingS,
              vertical: AppTheme.spacingXS,
            ),
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              item['category'] as String,
              style: GoogleFonts.notoSans(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryBlue,
              ),
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 법령 내용
          Text(
            item['content'] as String,
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: AppTheme.darkGray,
              height: 1.5,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 액션 버튼들
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // 상세보기 기능 (향후 구현)
                  },
                  icon: const Icon(Icons.info_outline, size: 16),
                  label: const Text('상세보기'),
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // 관련 판례 보기 기능 (향후 구현)
                  },
                  icon: const Icon(Icons.gavel, size: 16),
                  label: const Text('관련 판례'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
