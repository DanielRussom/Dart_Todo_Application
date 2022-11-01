import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/todo_screen.dart';
import 'package:simple_todo/todo_screen_view_model.dart';
import 'package:simple_todo/todo_task_card.dart';
import 'package:mocktail/mocktail.dart';
import 'test_utility.dart';

class MockTodoScreenViewModel extends Mock implements TodoScreenViewModel {

}

void main() {
  group('Todo_screen should', () {
    testWidgets('not display any tasks', (WidgetTester tester) async {
      var unitUnderTest = MultiProvider(
          providers: [ChangeNotifierProvider<TodoScreenViewModel>(create: (_) => TodoScreenViewModel())],
          child: const TodoScreen()
      );
      var testWrapper = wrapTestWidget(unitUnderTest);
      await tester.pumpWidget(testWrapper);

      final todoTaskFinder = find.byType(TodoTaskCard);
      expect(todoTaskFinder, findsNothing);
    });

    testWidgets('display one task', (WidgetTester tester) async {
      const taskTitle = 'testTitle';
      final viewModel = MockTodoScreenViewModel();
      final task = TodoTaskViewObject(title: 'test title', isComplete: false);
      when(() => viewModel.getTodoTasks()).thenReturn([task]);

      var unitUnderTest = MultiProvider(
          providers: [ChangeNotifierProvider<TodoScreenViewModel>(create: (_) => TodoScreenViewModel())],
          child: const TodoScreen()
      );
      var testWrapper = wrapTestWidget(unitUnderTest);
      await tester.pumpWidget(testWrapper);



      final todoTaskFinder = find.byType(TodoTaskCard);
      expect(todoTaskFinder, findsOneWidget);

      final todoTaskWidget = tester.widget<TodoTaskCard>(todoTaskFinder.first);
      expect(todoTaskWidget.title, equals(taskTitle));
    });
  });
}