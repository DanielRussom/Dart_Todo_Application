import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/todo_screen.dart';
import 'package:simple_todo/todo_screen_view_model.dart';
import 'package:simple_todo/todo_task_card.dart';

void main() {
  group('Todo app should', () {
    testWidgets('allow user to add a task', (WidgetTester tester) async {

      var unitUnderTest = MultiProvider(
          providers: [ChangeNotifierProvider<TodoScreenViewModel>(create: (_) => TodoScreenViewModel())],
          child: const TodoScreen()
      );

      var testWrapper = MaterialApp
        (
          home: unitUnderTest
      );

      await tester.pumpWidget(testWrapper);

      const input = 'Task Name';
      // Select textbox
      final taskInputBoxFinder = find.byKey(const Key('todoInputBox'));
      // Type task into textbox
      await tester.enterText(taskInputBoxFinder, input);
      await tester.pump();
      // Click add task button
      await tester.tap(find.byKey(const Key('addTaskButton')));
      await tester.pump();
      // See task is saved + displayed on screen
      final todoTaskFinder = find.byType(TodoTaskCard);
      expect(todoTaskFinder, findsOneWidget);
      
      final todoTaskWidget = tester.widget<TodoTaskCard>(todoTaskFinder.first);
      expect(todoTaskWidget.title, equals(input));

      expect(find.text(input), findsOneWidget);

      final taskInputBox = tester.widget<TextField>(taskInputBoxFinder.first);
      expect(taskInputBox.controller?.text, '');
    });
  });
}