import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoScreenViewModel>(builder: (context, viewModel, child) {
      return const Scaffold(
        body: TextField(
          key: Key('todoInputBox'),
        ),
      );
    });
  }
}

class TodoScreenViewModel extends ChangeNotifier {}
