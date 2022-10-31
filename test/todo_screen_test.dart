import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/todo_screen.dart';
import 'package:simple_todo/todo_task.dart';

import 'test_utility.dart';

void main() {
  group('Todo_screen should', () {
    testWidgets('not display any tasks', (WidgetTester tester) async {
      var unitUnderTest = MultiProvider(
          providers: [ChangeNotifierProvider<TodoScreenViewModel>(create: (_) => TodoScreenViewModel())],
          child: const TodoScreen()
      );
      var testWrapper = wrapTestWidget(unitUnderTest);
      await tester.pumpWidget(testWrapper);

      final todoTaskFinder = find.byType(TodoTask);
      expect(todoTaskFinder, findsNothing);
    });

    testWidgets('display one task', (WidgetTester tester) async {
      var unitUnderTest = MultiProvider(
          providers: [ChangeNotifierProvider<TodoScreenViewModel>(create: (_) => TodoScreenViewModel())],
          child: const TodoScreen()
      );
      var testWrapper = wrapTestWidget(unitUnderTest);
      await tester.pumpWidget(testWrapper);



      final todoTaskFinder = find.byType(TodoTask);
      expect(todoTaskFinder, findsOneWidget);

      final todoTaskWidget = tester.widget<TodoTask>(todoTaskFinder.first);
      //expect(todoTaskWidget.title, equals(input));
    });
  });
}