import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/todo_screen_view_model.dart';
import 'package:simple_todo/todo_task_card.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoScreenViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        body: Column(
          children: [
            TextField(
              key: Key('todoInputBox'),
            ),
            Divider(),
            ListView.builder(itemBuilder: (context, index) {
              var task = viewModel.getTodoTasks()[index];
              return task;
            })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: Key('addTaskButton'),
          onPressed: null,
        ),
      );
    });
  }
}
