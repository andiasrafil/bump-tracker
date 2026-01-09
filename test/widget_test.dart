import 'package:flutter_test/flutter_test.dart';
import 'package:bump_tracker/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BumpTrackerApp());

    // Verify that splash screen is displayed
    expect(find.text('BumpTracker'), findsOneWidget);
  });
}
