import 'package:flutter_test/flutter_test.dart';

import 'package:pojol/main.dart';

void main() {
  testWidgets('POJOL app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const POJOLApp());

    // Verify that the app title is present.
    expect(find.text('POJOL'), findsWidgets);
  });
}
