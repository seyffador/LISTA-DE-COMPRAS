import 'package:flutter/material.dart';
import 'package:projetofluttercontador/domain/entities/task.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;
  const EditTaskPage({required this.task,Key? key}) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {

  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
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
                    Task(
                      title: title,
                      isCompleted: widget.task.isCompleted,
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );

  }
}
