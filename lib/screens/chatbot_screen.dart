import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_layout.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Column(
        children: [
          // 헤더 섹션
          _buildHeader(context),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 채팅 영역
          Expanded(
            child: _buildChatArea(context),
          ),
          
          const SizedBox(height: AppTheme.spacingM),
          
          // 메시지 입력 영역
          _buildInputArea(context),
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
              Icons.chat_bubble_outline,
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
                  '실무챗봇',
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  'AI가 경찰 업무를 도와드립니다',
                  style: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingM,
              vertical: AppTheme.spacingS,
            ),
            decoration: BoxDecoration(
              color: AppTheme.successGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppTheme.successGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingXS),
                Text(
                  '온라인',
                  style: GoogleFonts.notoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.successGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          // 환영 메시지
          _buildWelcomeMessage(),
          
          const SizedBox(height: AppTheme.spacingL),
          
          // 채팅 메시지들
          Expanded(
            child: ListView(
              children: [
                _buildBotMessage('안녕하세요! POJOL 실무챗봇입니다. 어떤 업무에 대해 도움이 필요하신가요?'),
                _buildUserMessage('민원 처리 절차에 대해 알고 싶어요'),
                _buildBotMessage('민원 처리 절차는 다음과 같습니다:\n\n1. 민원 접수\n2. 내용 확인 및 분류\n3. 담당자 배정\n4. 처리 및 답변\n5. 결과 통보\n\n더 자세한 내용이 필요하시면 말씀해 주세요!'),
                _buildUserMessage('순찰 시 주의사항은 무엇인가요?'),
                _buildBotMessage('순찰 시 주요 주의사항:\n\n• 안전을 최우선으로 하세요\n• 의심스러운 상황 발견 시 즉시 보고\n• 시민과의 소통을 원활히 유지\n• 법적 절차 준수\n• 기록 및 보고서 작성'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.lightBlue, AppTheme.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.smart_toy,
              color: AppTheme.white,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'POJOL AI 어시스턴트',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  '경찰 업무 관련 질문을 자유롭게 해주세요',
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

  Widget _buildBotMessage(String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: BoxDecoration(
              color: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.smart_toy,
              color: AppTheme.primaryBlue,
              size: 16,
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: BoxDecoration(
                color: AppTheme.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: AppTheme.darkGray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserMessage(String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message,
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: AppTheme.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppTheme.spacingS),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.person,
              color: AppTheme.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '메시지를 입력하세요...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingM,
                  vertical: AppTheme.spacingS,
                ),
              ),
              maxLines: null,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(24),
            ),
            child: IconButton(
              onPressed: () {
                // 메시지 전송 기능 (향후 구현)
              },
              icon: const Icon(
                Icons.send,
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
