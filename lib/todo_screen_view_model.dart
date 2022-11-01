
import 'package:flutter/material.dart';
import 'package:simple_todo/todo_task_card.dart';

class TodoScreenViewModel extends ChangeNotifier {
  List<TodoTaskViewObject> getTodoTasks() {
    throw UnimplementedError();
  }
}

class TodoTaskViewObject {
  String title;

  bool isComplete;

  TodoTaskViewObject({required this.title, required this.isComplete});


}