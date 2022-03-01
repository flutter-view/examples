import 'package:flutter_test/flutter_test.dart';
import 'package:testdrive/main.dart';

void main() {
  testWidgets('testdrive smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TestdriveApp());
    // Verify that we show a hello world message
    expect(find.text('Hello world!'), findsOneWidget);
  });
}
