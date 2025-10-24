import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// 화면 크기 분류
enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

/// 화면 크기를 판단하는 유틸리티 클래스
class ResponsiveUtils {
  static ScreenSize getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < AppTheme.mobileBreakpoint) {
      return ScreenSize.mobile;
    } else if (width < AppTheme.tabletBreakpoint) {
      return ScreenSize.tablet;
    } else {
      return ScreenSize.desktop;
    }
  }
}

/// 반응형 빌더 위젯
/// 화면 크기에 따라 다른 레이아웃을 제공
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenSize screenSize) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = ResponsiveUtils.getScreenSize(context);
        return builder(context, screenSize);
      },
    );
  }
}

/// 반응형 패딩 위젯
/// 화면 크기에 따라 자동으로 패딩을 조절
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets? customPadding;

  const ResponsivePadding({
    super.key,
    required this.child,
    this.customPadding,
  });

  EdgeInsets _getPadding(ScreenSize screenSize) {
    if (customPadding != null) {
      return customPadding!;
    }

    switch (screenSize) {
      case ScreenSize.mobile:
        return const EdgeInsets.all(AppTheme.spacingM);
      case ScreenSize.tablet:
        return const EdgeInsets.all(AppTheme.spacingL);
      case ScreenSize.desktop:
        return const EdgeInsets.all(AppTheme.spacingXL);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        return Padding(
          padding: _getPadding(screenSize),
          child: child,
        );
      },
    );
  }
}

/// 반응형 그리드 위젯
/// 화면 크기에 따라 자동으로 컬럼 수를 조절
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final double spacing;
  final double runSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.spacing = AppTheme.spacingM,
    this.runSpacing = AppTheme.spacingM,
  });

  int _getColumnCount(ScreenSize screenSize) {
    switch (screenSize) {
      case ScreenSize.mobile:
        return mobileColumns ?? 1;
      case ScreenSize.tablet:
        return tabletColumns ?? 2;
      case ScreenSize.desktop:
        return desktopColumns ?? 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        final columns = _getColumnCount(screenSize);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: runSpacing,
            crossAxisSpacing: spacing,
            childAspectRatio: 1.0,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}

/// 반응형 레이아웃 래퍼
/// 모바일에서는 Column, 데스크톱에서는 Row로 변환
class ResponsiveLayout extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const ResponsiveLayout({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSize) {
        if (screenSize == ScreenSize.mobile) {
          return Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: children,
          );
        } else {
          return Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: children,
          );
        }
      },
    );
  }
}
