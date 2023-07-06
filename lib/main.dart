import 'package:flutter/material.dart';
import 'package:projetofluttercontador/presenter/tasks/tasks_page.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      theme: ThemeData(
        //useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const TasksPage(),
    );
  }
}
