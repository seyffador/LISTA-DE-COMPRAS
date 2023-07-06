import 'package:flutter/material.dart';
import 'package:projetofluttercontador/domain/entities/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text.trim();
                if (title.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Task(title: title),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );

  }
}
