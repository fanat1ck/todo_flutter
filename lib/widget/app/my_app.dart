import 'package:flutter/material.dart';

import '../add_task/add_task_widget.dart';
import '../enter/enter_widget.dart';
import '../todo/todo_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/enter': (context) => const EnterWidget(),
        '/todo': (context) => const TodoWidget(),
        '/add_task': (context) => const AddTaskWidget(),
      },
      initialRoute: '/enter',
    );
  }
}
