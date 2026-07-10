import 'package:flutter_test/flutter_test.dart';

import 'package:news/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const NewsApp());
    expect(find.byType(NewsApp), findsOneWidget);
  });
}
