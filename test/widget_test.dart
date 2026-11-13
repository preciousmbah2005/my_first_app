import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:my_first_app/main.dart';

void main() {
  testWidgets('shows the app title and centered greeting', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.title, 'My First App');
    expect(app.theme!.colorScheme.primary, isNot(Colors.deepPurple));
    expect(find.text('My First App'), findsOneWidget);
    expect(find.text('Hello, Precious!'), findsOneWidget);
    expect(
      find.text('A simple Flutter app built with Material Design.'),
      findsOneWidget,
    );
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNothing);

    final greeting = tester.getRect(find.text('Hello, Precious!'));
    final subtitle = tester.getRect(
      find.text('A simple Flutter app built with Material Design.'),
    );
    expect(greeting.center.dx, subtitle.center.dx);
    expect(greeting.bottom, lessThan(subtitle.top));
  });

  testWidgets('prints the screen width in logical pixels', (
    WidgetTester tester,
  ) async {
    tester.view.devicePixelRatio = 2;
    tester.view.physicalSize = const Size(840, 1200);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final messages = <String>[];
    final previousDebugPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) {
        messages.add(message);
      }
    };
    addTearDown(() => debugPrint = previousDebugPrint);

    await tester.pumpWidget(const MyApp());

    expect(messages, contains('Screen width: 420.0 logical pixels'));
  });
}
