import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class PhotoEditorScreen extends StatelessWidget {
  const PhotoEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 편집 영역
          Expanded(
            child: ResponsiveBuilder(
              builder: (context, screenSize) {
                return screenSize == ScreenSize.mobile
                    ? _buildMobileEditor(context)
                    : _buildDesktopEditor(context);
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
              Icons.photo_camera,
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
                  '현장사진편집기',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '현장 사진을 편집하고 증거자료로 활용하세요',
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

  Widget _buildMobileEditor(BuildContext context) {
    return Column(
      children: [
        // 이미지 업로드 영역
        Expanded(
          flex: 2,
          child: _buildImageUploadArea(context),
        ),
        
        const SizedBox(height: AppTheme.spacingM),
        
        // 편집 도구 영역
        Expanded(
          flex: 1,
          child: _buildEditTools(context),
        ),
      ],
    );
  }

  Widget _buildDesktopEditor(BuildContext context) {
    return Row(
      children: [
        // 이미지 업로드 및 미리보기 영역
        Expanded(
          flex: 2,
          child: _buildImageUploadArea(context),
        ),
        
        const SizedBox(width: AppTheme.spacingL),
        
        // 편집 도구 영역
        Expanded(
          flex: 1,
          child: _buildEditTools(context),
        ),
      ],
    );
  }

  Widget _buildImageUploadArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Text(
            '사진 업로드',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 업로드 영역
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.mediumGray.withValues(alpha: 0.3),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 64,
                    color: AppTheme.mediumGray,
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    '사진을 드래그하거나 클릭하여 업로드',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      color: AppTheme.mediumGray,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingS),
                  Text(
                    'JPG, PNG, HEIC 파일 지원',
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: AppTheme.mediumGray,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingL),
                  ElevatedButton.icon(
                    onPressed: () {
                      // 파일 선택 기능 (향후 구현)
                    },
                    icon: const Icon(Icons.add_photo_alternate),
                    label: const Text('사진 선택'),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 미리보기 영역 (업로드 후 표시)
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.lightGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '미리보기 영역',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: AppTheme.mediumGray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditTools(BuildContext context) {
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
            '편집 도구',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 기본 편집 도구
          _buildToolSection('기본 편집', [
            _buildToolButton(Icons.crop, '자르기'),
            _buildToolButton(Icons.rotate_right, '회전'),
            _buildToolButton(Icons.flip, '뒤집기'),
            _buildToolButton(Icons.brightness_6, '밝기'),
          ]),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 필터 도구
          _buildToolSection('필터', [
            _buildToolButton(Icons.filter_b_and_w, '흑백'),
            _buildToolButton(Icons.filter_vintage, '빈티지'),
            _buildToolButton(Icons.filter_hdr, 'HDR'),
            _buildToolButton(Icons.filter_none, '원본'),
          ]),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 증거 표시 도구
          _buildToolSection('증거 표시', [
            _buildToolButton(Icons.edit, '텍스트'),
            _buildToolButton(Icons.draw, '화살표'),
            _buildToolButton(Icons.circle_outlined, '원형'),
            _buildToolButton(Icons.crop_square, '사각형'),
          ]),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 액션 버튼들
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // 되돌리기 기능 (향후 구현)
                  },
                  icon: const Icon(Icons.undo, size: 16),
                  label: const Text('되돌리기'),
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // 저장 기능 (향후 구현)
                  },
                  icon: const Icon(Icons.save, size: 16),
                  label: const Text('저장'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolSection(String title, List<Widget> tools) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkGray,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        Wrap(
          spacing: AppTheme.spacingS,
          runSpacing: AppTheme.spacingS,
          children: tools,
        ),
      ],
    );
  }

  Widget _buildToolButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingS),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.mediumGray.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppTheme.primaryBlue,
            size: 20,
          ),
          const SizedBox(height: AppTheme.spacingXS),
          Text(
            label,
            style: GoogleFonts.notoSans(
              fontSize: 10,
              color: AppTheme.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
